import ckan.plugins as plugins
import ckan.logic as logic
import ckan.lib.helpers as h
import ckan.plugins.toolkit as tk
import csv
import os
import json
from ckan.common import OrderedDict, _, json, request, c, g, response
import ckan.model as model
from routes.mapper import SubMapper

def get_group_select_list():
    result = []
    user = tk.get_action('get_site_user')({'ignore_auth': True}, {})
    context = {'user': user['name']}
    groups = logic.get_action('group_list')(context, {})

    for group in groups:
        result.append({'value': group})
    return result

def group_id():
    id =  request.params.get('group') or request.params.get('groups__0__id')
    return id

# vocab setup
# "Geospatial Topic" and "Field(s) of Research" are tag vocabularies.
def create_geospatial_topics():
    user = tk.get_action('get_site_user')({'ignore_auth': True}, {})
    context = {'user': user['name']}
    vocab = model.Vocabulary.get('geospatial_topics')
    if not vocab:
        data = {'name': 'geospatial_topics'}
        vocab = tk.get_action('vocabulary_create')(context, data)
        for tag in ('Farming', 'Biota', 'Boundaries', 'Climatology Meteorology and Atmosphere', 'Economy', 'Elevation',
                    'Environment',
                    'Geoscientific information', 'Health', 'Imagery base maps and Earth cover',
                    'Intelligence and Military',
                    'Inland waters', 'Location', 'Oceans', 'Planning and Cadastre', 'Society', 'Transportation',
                    'Utilities and Communication'):
            data = {'name': tag, 'vocabulary_id': vocab['id']}
            tk.get_action('tag_create')(context, data)


def geospatial_topics():
    create_geospatial_topics()
    try:
        tag_list = tk.get_action('tag_list')
        geospatial_topics = tag_list(data_dict={'vocabulary_id': 'geospatial_topics'})
        return geospatial_topics
    except tk.ObjectNotFound:
        return None

def groups():
    query = model.Group.all(group_type='group')

    def convert_to_dict(user):
        out = {}
        for k in ['id', 'name', 'title']:
            out[k] = getattr(user, k)
        return out

    out = map(convert_to_dict, query.all())
    return out

def formats():
    """
    returns set of portal default resource formats
    """
    defined_formats = set(map(lambda (_1, format, _3): format, h.resource_formats().values()))
    sorted_formats = sorted(defined_formats, key=lambda format: format.upper())
    return sorted_formats
    
def create_fields_of_research():

    user = tk.get_action('get_site_user')({'ignore_auth': True}, {})
    context = {'user': user['name']}
    vocab = model.Vocabulary.get('fields_of_research')
    if not vocab:
        print "Loading ABS Fields of Research for the first time, please wait..."
        data = {'name': 'fields_of_research'}
        vocab = tk.get_action('vocabulary_create')(context, data)
        with open(os.path.dirname(os.path.abspath(__file__)) + '/ABS Fields Of Research.csv', 'rb') as csvfile:
            forcsv = csv.reader(csvfile)
            for row in forcsv:
                data = {'name': row[1].strip().replace(',', '')[:100], 'vocabulary_id': vocab['id']}
                tk.get_action('tag_create')(context, data)
        print "ABS Fields of Research loaded"


def fields_of_research():
    create_fields_of_research()
    try:
        tag_list = tk.get_action('tag_list')
        fields_of_research = tag_list(data_dict={'vocabulary_id': 'fields_of_research', 'all_fields': False})
        return fields_of_research
    except tk.ObjectNotFound:
        return None


def spatial_bound(spatial_str):
    if spatial_str and spatial_str != '':
        spatial_dict = json.loads(spatial_str)
        if spatial_dict['type'] == 'Point':
            minx = spatial_dict['coordinates'][0]
            minx = spatial_dict['coordinates'][0]
            maxx = spatial_dict['coordinates'][0]
            miny = spatial_dict['coordinates'][1]
            maxy = spatial_dict['coordinates'][1]
        if spatial_dict['type'] == 'Polygon':
            minx = spatial_dict['coordinates'][0][0][0]
            maxx = spatial_dict['coordinates'][0][1][0]
            miny = spatial_dict['coordinates'][0][0][1]
            maxy = spatial_dict['coordinates'][0][2][1]
        if minx:
            return (minx,maxx,miny,maxy)
    return None

def get_user_full(username):
    try:
        return plugins.toolkit.get_action('user_show')({'return_minimal': True, 'keep_sensitive_data': True, 'keep_email': True},{'id': username})
    except plugins.toolkit.ObjectNotFound:
        return None
def get_org_full(id):
        try:
            return plugins.toolkit.get_action('organization_show')({'include_datasets': False},{'id': id})
        except plugins.toolkit.ObjectNotFound:
            return None
def is_hosted(pkg):
    hosted = 'Hosted'
    for res in pkg['resources']:
	if 'data.sa.gov.au' not in res['url']:
		hosted = 'Linked'
    return hosted
def get_pkg_obj_extra(pkg_dict, key, default=None):
    '''Returns the value for the dataset extra with the provided key.
    If the key is not found, it returns a default value, which is None by
    default.
    :param pkg_dict: dictized dataset
    :key: extra key to lookup
    :default: default value returned if not found
    '''
    #print pkg_dict['extras']
    extras = pkg_dict.extras if hasattr(pkg_dict,'extras') else []

    for extra in extras:
        if extra['key'] == key:
            return extra['value']

    return default
def get_popular_tags():
    connection = model.Session.connection()
    res = connection.execute("select tag.name from package_tag INNER JOIN tag on tag.id = package_tag.tag_id where package_tag.package_id not in (select distinct package_id from package_extra where key = 'harvest_portal') group by tag.name order by count(*) desc limit 3;").fetchall()
    return res

class AGLSDatasetPlugin(plugins.SingletonPlugin,
                        tk.DefaultDatasetForm):
    '''An example IDatasetForm CKAN plugin.

    Uses a tag vocabulary to add a custom metadata field to datasets.

    '''
    plugins.implements(plugins.IConfigurer, inherit=False)
    plugins.implements(plugins.IDatasetForm, inherit=False)
    plugins.implements(plugins.ITemplateHelpers)
    plugins.implements(plugins.IRoutes, inherit=True)

    def before_map(self, map):
        with SubMapper(map, controller='ckanext.agls.controller:AGLSController') as m:
            m.connect('/dataset/{id}/gmd', action='gmd')
            m.connect('/api/2/util/gazetteer/autocomplete', action='geo_autocomplete')
            m.connect('/api/2/util/gazetteer/latlon', action='geo_latlon')
            m.connect('/dataset/new_resource/{id}', action='resource_redefine', original_action='new_resource')
            m.connect('/dataset/{id}/resource_edit/{resource_id}', action='resource_redefine', original_action='resource_edit')
            m.connect('/dataset/{id}/resource_delete/{resource_id}', action='resource_redefine', original_action='resource_delete')
        return map

    def get_helpers(self):
        return {'fields_of_research': fields_of_research, 'geospatial_topics': geospatial_topics,
                'get_group_select_list': get_group_select_list, 'spatial_bound': spatial_bound,
                'get_user_full': get_user_full, 'get_org_full': get_org_full, 'groups': groups, 
                'formats': formats, 'group_id': group_id, 'is_hosted': is_hosted, 
                'get_pkg_obj_extra': get_pkg_obj_extra, 'get_popular_tags': get_popular_tags}

    def update_config(self, config):
        # Add this plugin's templates dir to CKAN's extra_template_paths, so
        # that CKAN will use this plugin's custom templates.
        # here = os.path.dirname(__file__)
        # rootdir = os.path.dirname(os.path.dirname(here))

        tk.add_template_directory(config, 'templates')
        tk.add_public_directory(config, 'theme/public')
        tk.add_public_directory(config, 'fanstatic/ckanext-agls')
        tk.add_resource('fanstatic', 'ckanext-agls')
        # config['licenses_group_url'] = 'http://%(ckan.site_url)/licenses.json'


    def is_fallback(self):
        # Return True to register this plugin as the default handler for
        # package types not handled by any other IDatasetForm plugin.
        return True

    def package_types(self):
        # This plugin doesn't handle any special package types, it just
        # registers itself as the default (above).
        return []


    def create_package_schema(self):
        schema = super(AGLSDatasetPlugin, self).create_package_schema()
        schema = self._modify_package_schema(schema)
        return schema

    def update_package_schema(self):
        schema = super(AGLSDatasetPlugin, self).update_package_schema()
        schema = self._modify_package_schema(schema)
        return schema

    def show_package_schema(self):
        schema = super(AGLSDatasetPlugin, self).show_package_schema()

        # Don't show vocab tags mixed in with normal 'free' tags
        # (e.g. on dataset pages, or on the search page)
        schema['tags']['__extras'].append(tk.get_converter('free_tags_only'))

        # Add our custom_text field to the dataset schema.
        # ignore_missing == optional
        # ignore_empty == mandatory but not for viewing
        # !!! always convert_from_extras first
        schema.update({

            'contact_point': [tk.get_converter('convert_from_extras'),
                              tk.get_validator('ignore_empty')],
            'contact_info': [tk.get_converter('convert_from_extras'),
                           tk.get_validator('ignore_missing')],
            'spatial_coverage': [tk.get_converter('convert_from_extras'),
                                 tk.get_validator('ignore_empty')],
            'spatial': [tk.get_converter('convert_from_extras'),
                        tk.get_validator('ignore_missing')],
            'jurisdiction': [tk.get_converter('convert_from_extras'),
                             tk.get_validator('ignore_empty')],
            'temporal_coverage_from':  [tk.get_converter('convert_from_extras'),
                                        tk.get_validator('ignore_empty')],
            'temporal_coverage_to': [tk.get_converter('convert_from_extras'),
                                     tk.get_validator('ignore_missing')],
            'data_granularity': [tk.get_converter('convert_from_extras'),
                                     tk.get_validator('ignore_missing')],
            'data_state': [tk.get_converter('convert_from_extras'),
                           tk.get_validator('ignore_empty')],
            'update_freq': [tk.get_converter('convert_from_extras'),
                            tk.get_validator('ignore_missing')],
            'data_model': [tk.get_converter('convert_from_extras'),
                           tk.get_validator('ignore_missing')],
            'language': [tk.get_converter('convert_from_extras'),
                           tk.get_validator('ignore_missing')],
            'geospatial_topic': [
                tk.get_converter('convert_from_tags')('geospatial_topics'),
                tk.get_validator('ignore_missing')],
            'field_of_research': [
                tk.get_converter('convert_from_tags')('fields_of_research'),
                tk.get_validator('ignore_missing')],
        })
        schema['resources'].update({
            'url': [tk.get_converter('not_empty'), unicode, tk.get_converter('remove_whitespace')]
        })
        return schema

    def _modify_package_schema(self, schema):
        # Add our custom_test metadata field to the schema, this one will use
        # convert_to_extras instead of convert_to_tags.
        # ignore_missing == optional
        # not_empty == mandatory, enforced here while modifying

        schema.update({
     'notes': [tk.get_validator('not_empty')],
            'contact_point': [tk.get_converter('convert_to_extras'),
                              tk.get_validator('not_empty')],
            'contact_info': [tk.get_validator('ignore_missing'),
                        tk.get_converter('convert_to_extras')],
            'spatial_coverage':[tk.get_converter('convert_to_extras'),
                              tk.get_validator('not_empty')],
            'spatial': [tk.get_validator('ignore_missing'),
                        tk.get_converter('convert_to_extras')],
            'jurisdiction': [tk.get_converter('convert_to_extras'),
                             tk.get_validator('not_empty')],
            'temporal_coverage_from': [tk.get_validator('ignore_missing'),
                        tk.get_converter('convert_to_extras')],
            'temporal_coverage_to': [tk.get_validator('ignore_missing'),
                                     tk.get_converter('convert_to_extras')],
         'data_granularity': [tk.get_validator('ignore_missing'),
                                     tk.get_converter('convert_to_extras')],
            'data_state': [tk.get_converter('convert_to_extras'),
                           tk.get_validator('not_empty')],
            'update_freq': [tk.get_converter('convert_to_extras'),
                           tk.get_validator('not_empty')],

            'data_models': [tk.get_validator('ignore_missing'),
                            tk.get_converter('convert_to_extras')],
            'language': [tk.get_validator('ignore_missing'),
                            tk.get_converter('convert_to_extras')],
            'geospatial_topic': [
                tk.get_validator('ignore_missing'),
                tk.get_converter('convert_to_tags')('geospatial_topics')
            ],
            'field_of_research': [
                tk.get_validator('ignore_missing'),
                tk.get_converter('convert_to_tags')('fields_of_research')
            ],

        })
        schema['resources'].update({
            'url': [tk.get_converter('not_empty'), unicode, tk.get_converter('remove_whitespace')]
        })
        return schema
