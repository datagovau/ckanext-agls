#! /usr/bin/env python
from csv import DictReader
import os
from argparse import ArgumentParser
from threading import Thread, BoundedSemaphore
import logging
import requests
from json import dumps, loads, load
import uuid
import functools
from ckan.logic.validators import boolean_validator
from ckan.lib.munge import munge_name

uuid3 = functools.partial(uuid.uuid3, uuid.NAMESPACE_DNS)

log = logging.getLogger(__name__)
logHandler = logging.StreamHandler()
logHandler.setLevel(logging.DEBUG)

log.addHandler(logHandler)

parser = ArgumentParser()
parser.add_argument(
    '--content', '-c', required=True, metavar='file.csv',
    help='file containing metadata')

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
log.setLevel(args.log_level)
semaphore = BoundedSemaphore(args.threads)
languages = load(open(
    os.path.dirname(__file__) + '/../ckanext/agls/languages.json'))

org_mapping = {}


API_KEY = args.api_key
HOST = args.host
DATA_URL = 'https://data.cese.nsw.gov.au'


def action_url(action):
    return HOST.strip('/') + '/api/3/action/' + action


class Importer(Thread):
    semaphore = semaphore

    def __init__(self, *args, **kwargs):
        assert 'dataset' in kwargs
        self.dataset = kwargs.pop('dataset')
        super(Importer, self).__init__(*args, **kwargs)

    def run(self):
        try:
            self._import_dataset()
        finally:
            semaphore.release()
            log.debug('[{0:^10}] Semaphore lock released'.format(self.name))

    def _get_org_id(self, org_name):
        mn = munge_name(org_name)
        if mn in org_mapping:
            return org_mapping[mn]
        org_dict = requests.get(
            action_url('organization_show'),
            params={'id': mn}
        )
        if org_dict.ok:
            return org_dict.json()['result']['id']
        log.error(org_dict.content)
        raise AttributeError('Organization %s not found' % mn)

    def _get_language(self, language):
        code = languages.keys()[languages.values().index(language)]
        return code

    def _dataset_to_pkg(self):
        added, modified = loads(
            self.dataset['[dateadded, date modified]'])
        pkg = dict(
            author=self.dataset['publisher'],
            contact_info=not boolean_validator(
                self.dataset['expose user contact information'], 0),
            contact_point=self.dataset['contact email'],
            data_model=self.dataset['data models'],
            data_state=self.dataset['data status'].lower(),
            field_of_research=self.dataset['field of research'],
            geospatial_topic=self.dataset['geospatial topic'].title().replace(
                ' And ', ' and '),
            groups=[
                {'name': munge_name(group.strip())}
                for group in self.dataset['category'].lower().split(',')],
            id=str(uuid3(self.dataset['title'])),
            jurisdiction=self.dataset['jurisdiction'],
            language=self._get_language(self.dataset['language']),
            license_id=self.dataset['license'],
            metadata_created=added,
            metadata_modified=modified,
            name=munge_name(self.dataset['title']),
            notes=self.dataset['description'],
            owner_org=self._get_org_id(self.dataset['organisation']),
            private=not boolean_validator(self.dataset['visibility'], 0),
            spatial_coverage=self.dataset['geospatial coverage'],
            tags=[
                {'name': tag}
                for tag in loads(
                    self.dataset['tags/keywords'].replace("'", '"'))],
            temporal_coverage_from=self.dataset['temporal coverage from'],
            temporal_coverage_to=self.dataset['temporal coverage to'],
            theme=self.dataset['theme'],
            title=self.dataset['title'],
            update_freq=self.dataset['update frequency'].lower()
        )

        if self.dataset['socrata id']:
            pkg['resources'] = [{
                'url': (DATA_URL + '/resource/' +
                        self.dataset['socrata id'] + '.csv'),
                'name': self.dataset['title'],
                'format': 'csv'
            }]
        return pkg

    def _check_groups(self):
        for group in self.dataset['category'].split(','):
            group = group.strip()
            mn = munge_name(group)
            existing = requests.get(
                action_url('group_show'),
                params={'id': mn}
            )
            if not existing.ok:
                requests.post(
                    action_url('group_create'),
                    headers={
                        'Authorization': API_KEY,
                        'Content-type': 'application/json'
                    },
                    data=dumps({'name': mn, 'title': group})
                )

    def _import_dataset(self):
        do_something = False
        pkg = self._dataset_to_pkg()
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
            log.debug(req.content)


if not os.path.isfile(args.content):
    raise RuntimeError('Unable to locate content file')

with open(args.content, 'r') as content:
    reader = DictReader(content)
    reader.fieldnames = map(str.lower, reader.fieldnames)

    for line in reader:
        thread = Importer(dataset=line)
        log.debug('[{0:^10}] Semaphore lock aquired'.format(thread.name))
        semaphore.acquire()
        thread.start()
        break
