#! /usr/bin/env python
from argparse import ArgumentParser
from ckan.lib.munge import munge_name
from ckan.logic.validators import boolean_validator
from ckan.model import Package, PackageRevision
from ConfigParser import ConfigParser
from csv import DictReader
from datetime import datetime
from json import dumps, loads, load
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from threading import Thread, BoundedSemaphore, RLock
import functools
import logging
import os
import re
import requests
import uuid

cc_by = re.compile(r'cc\w+by', re.I)

uuid3 = functools.partial(uuid.uuid3, uuid.NAMESPACE_DNS)

log = logging.getLogger(__name__)
logHandler = logging.StreamHandler()
logHandler.setLevel(logging.DEBUG)

log.addHandler(logHandler)

group_check_lock = RLock()
org_check_lock = RLock()

parser = ArgumentParser()
parser.add_argument(
    '--content', '-C', required=True, metavar='file.csv',
    help='file containing metadata')

parser.add_argument('--config', '-c', required=True)
parser.add_argument('--host', '-H', required=True)
parser.add_argument('--api-key', '-A', required=True)
parser.add_argument(
    '--no-create', action='store_true',
    help='Only existing packages will be updated')
parser.add_argument(
    '--no-update', action='store_true',
    help='Only new packages will be created')
parser.add_argument(
    '--threads', '-t', default=10, type=int,
    help='Max number of concurent threads(10 by default)')

parser.add_argument(
    '--log-level', '-l', default=30, type=int, choices=list(range(10, 51, 10)),
    help='Log levels: 10 - DEBUG, 50 - FATAL')

args = parser.parse_args()
config = ConfigParser()
config.read([args.config])
db_url = config.get('app:main', 'sqlalchemy.url')
engine = create_engine(db_url)
Session = sessionmaker(bind=engine)

log.setLevel(args.log_level)
semaphore = BoundedSemaphore(args.threads)
languages = load(open(
    os.path.dirname(__file__) + '/../ckanext/agls/languages.json'))

org_mapping = {}


API_KEY = args.api_key
HOST = args.host
DATA_URL = 'https://data.cese.nsw.gov.au'

org_cache = {}
group_cache = set()

def action_url(action):
    return HOST.strip('/') + '/api/3/action/' + action


class Importer(Thread):

    def __init__(self, *args, **kwargs):
        assert 'dataset' in kwargs
        self.dataset = kwargs.pop('dataset')
        super(Importer, self).__init__(*args, **kwargs)

    def run(self):
        log.debug('[{0:^10}] Semaphore lock aquired'.format(self.name))
        try:
            self._import_dataset()
        finally:
            log.debug('[{0:^10}] Semaphore lock released'.format(self.name))
            semaphore.release()

    def _get_org_id(self, org_name):
        mn = munge_name(org_name)
        if mn in org_mapping:
            return org_mapping[mn]
        if mn in org_cache:
            return org_cache[mn]
        org_dict = requests.get(
            action_url('organization_show'),
            params={'id': mn}
        )
        if org_dict.ok:
            org_id = org_dict.json()['result']['id']
            org_cache[mn] = org_id
            return org_id
        log.error('[{0:^10}] {1}'.format(self.name, org_dict.content))
        with org_check_lock:

            org = requests.post(
                action_url('organization_create'),
                headers={
                    'Authorization': API_KEY,
                    'Content-type': 'application/json'
                },
                data=dumps({
                    'title': org_name,
                    'name': mn
                })
            )
            if org.ok:
                log.info('[{0:^10}] Organization {1} successfully created'.format(
                    self.name, org_name))
            else:
                log.error('[{0:^10}] Unable to create organization {1}: {2}'.format(
                    self.name, org_name, org.content))
        # raise AttributeError('Organization %s not found' % mn)

    def _get_language(self, language):

        code = languages.keys()[
            languages.values().index(language)] if language else ''
        return code

    def _get_license(self, license):
        if cc_by.match(license):
            return 'cc-by'
        # Fallback value
        return 'cc-by'

    def _dataset_to_pkg(self):
        theme = self.dataset['theme']
        if theme == 'EDUCATION':
            theme = 'Vocational Education & Training (VET)'

        pkg = dict(
            author=self.dataset['publisher'],
            contact_info=boolean_validator(
                self.dataset['expose user contact information'], 0),
            contact_point=self.dataset['contact email'],
            data_model=self.dataset['data models'],
            data_state=self.dataset['data status'].lower(),
            # field_of_research=self.dataset['field of research'][
            #     self.dataset['field of research'].index(' ')+1:],
            geospatial_topic=self.dataset['geospatial topic'].title().replace(
                ' And ', ' and '),
            groups=[
                {'name': munge_name(group.strip())}
                for group in self.dataset['category'].lower().split(',')],
            id=str(uuid3(self.dataset['title'] + self.dataset['socrata id'])),
            jurisdiction=self.dataset['jurisdiction'],
            language=self._get_language(self.dataset['language']),
            license_id=self._get_license(self.dataset['license']),
            name=munge_name(self.dataset['title']),
            notes=self.dataset['description'],
            owner_org=self._get_org_id(self.dataset.get('organisation', self.dataset['publisher'])),
            private=not boolean_validator(self.dataset['visibility'], 0),
            spatial_coverage=self.dataset['geospatial coverage'],
            tags=[
                {'name': munge_name(tag)}
                for tag in loads(
                    self.dataset['tags'].replace("'", '"'))],
            temporal_coverage_from=self.dataset['temporal coverage from'],
            temporal_coverage_to=self.dataset['temporal coverage to'],
            theme=theme,
            title=self.dataset['title'],
            update_freq=self.dataset['update frequency'].lower()
        )
        pkg['name'] = pkg['name'][:95] + pkg['id'][:5]

        if self.dataset['socrata id']:
            format = 'csv'
            csv_res = {
                'name': self.dataset['title'],
                'format': format
            }
            csv_res_name = self.dataset['socrata id'] + '.csv'
            csv_res_url = DATA_URL + '/resource/' + csv_res_name

            csv_res['url'] = csv_res_name
            csv_res['id'] = str(uuid3(pkg['id'] + csv_res_name))
            socrata_file = requests.get(csv_res_url, stream=True).raw
            socrata_file.name = csv_res_name
            pkg['upload'] = (
                'upload',
                socrata_file
            )
            pkg['resources'] = [csv_res]
        return pkg

    def _check_groups(self):
        for group in self.dataset['category'].split(','):
            group = group.strip()
            mn = munge_name(group)
            if mn in group_cache:
                continue
            with group_check_lock:
                existing = requests.get(
                    action_url('group_show'),
                    headers={'Authorization': API_KEY},
                    params={'id': mn}
                )
                if not existing.ok:
                    log.info(
                        '[{0:^10}] Creating group <{1}>'.format(self.name, mn))
                    requests.post(
                        action_url('group_create'),
                        headers={
                            'Authorization': API_KEY,
                            'Content-type': 'application/json'
                        },
                        data=dumps({'name': mn, 'title': group})
                    )
                    group_cache.add(mn)

    def _update_dates(self, id):
        dates = self.dataset['[dateadded, date modified]']
        if not dates:
            return
        added, modified = map(datetime.fromtimestamp, loads(
            dates))
        s = Session()
        # s.query(Package).filter_by(id=id).update(
        #     {'metadata_modified': modified})
        rev = s.query(PackageRevision).filter_by(id=id).order_by(
            PackageRevision.revision_timestamp.asc()).first()
        # import pdb; pdb.set_trace()
        if rev:
            rev.revision_timestamp = added
        else:
            log.warn('[{0:^10}] metadata_created not updated'.format(self.name))

        s.commit()
        s.close()

    def _import_dataset(self):
        do_something = False
        pkg = self._dataset_to_pkg()
        resources = pkg.get('resources', [])
        upload = pkg.pop('upload', None)
        self._check_groups()
        pkg_str = dumps(pkg)
        result = requests.get(
            action_url('package_show'),
            headers={'Authorization': API_KEY},
            params={'id': pkg['id']}
        )

        if result.ok:
            if not args.no_update:
                do_something = True
                action = 'package_update'
        else:
            if not args.no_create:
                do_something = True
                action = 'package_create'

        if do_something:
            req = requests.post(
                action_url(action),
                headers={
                    'Authorization': API_KEY,
                    'Content-type': 'application/json'
                },
                data=pkg_str
            )
            req = requests.post(
                action_url(action),
                headers={
                    'Authorization': API_KEY,
                    'Content-type': 'application/json'
                },
                data=pkg_str
            )
            for resource in resources:
                resource.pop('url')
                requests.post(
                    action_url('resource_update'),
                    headers={'Authorization': API_KEY},
                    data=resource,
                    files=[upload]
                )
            self._update_dates(pkg['id'])
            if req.ok:
                log.info('[{0:^10}] Success: {1}'.format(
                    self.name, pkg['name']))
            else:
                log.error('[{0:^10}] Failed: {1}'.format(
                    thread.name, req.content))


if not os.path.isfile(args.content):
    raise RuntimeError('Unable to locate content file')

with open(args.content, 'r') as content:
    reader = DictReader(content)
    reader.fieldnames = map(str.lower, reader.fieldnames)

    for number, line in enumerate(reader, 1):
        semaphore.acquire()
        thread = Importer(dataset=line, name="Thread-%d" % number)
        thread.start()
        # break
