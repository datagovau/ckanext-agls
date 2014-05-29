import ckan.plugins as plugins
import ckan.plugins.toolkit as tk

# vocab setup
# "Geospatial Topic" and "Field(s) of Research" are tag vocabularies.
def create_country_codes():
    user = tk.get_action('get_site_user')({'ignore_auth': True}, {})
    context = {'user': user['name']}
    try:
        data = {'id': 'country_codes'}
        tk.get_action('vocabulary_show')(context, data)
    except tk.ObjectNotFound:
        data = {'name': 'country_codes'}
        vocab = tk.get_action('vocabulary_create')(context, data)
        for tag in (u'uk', u'ie', u'de', u'fr', u'es'):
            data = {'name': tag, 'vocabulary_id': vocab['id']}
            tk.get_action('tag_create')(context, data)


def country_codes():
    create_country_codes()
    try:
        tag_list = tk.get_action('tag_list')
        country_codes = tag_list(data_dict={'vocabulary_id': 'country_codes'})
        return country_codes
    except tk.ObjectNotFound:
        return None


class AGLSDatasetPlugin(plugins.SingletonPlugin,
                        tk.DefaultDatasetForm):
    '''An example IDatasetForm CKAN plugin.

    Uses a tag vocabulary to add a custom metadata field to datasets.

    '''
    plugins.implements(plugins.IConfigurer, inherit=False)
    plugins.implements(plugins.IDatasetForm, inherit=False)
    plugins.implements(plugins.ITemplateHelpers)

    def get_helpers(self):
        return {'country_codes': country_codes}

    def update_config(self, config):
        # Add this plugin's templates dir to CKAN's extra_template_paths, so
        # that CKAN will use this plugin's custom templates.
        # here = os.path.dirname(__file__)
        # rootdir = os.path.dirname(os.path.dirname(here))

        tk.add_template_directory(config, 'templates')
        tk.add_public_directory(config, 'theme/public')
        tk.add_resource('theme/public', 'ckanext-agls')
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
            'agency_program': [tk.get_converter('convert_from_extras'),
                               tk.get_validator('ignore_missing')],
            'contact_point': [tk.get_converter('convert_from_extras'),
                              tk.get_validator('ignore_empty')],
            'spatial_coverage': [tk.get_converter('convert_from_extras'),
                                 tk.get_validator('ignore_empty')],
            'granularity': [tk.get_converter('convert_from_extras'),
                            tk.get_validator('ignore_empty')],
            'jurisdiction': [tk.get_converter('convert_from_extras'),
                             tk.get_validator('ignore_empty')],
            'temporal_coverage': [tk.get_converter('convert_from_extras'),
                                  tk.get_validator('ignore_empty')],
            'data_state': [tk.get_converter('convert_from_extras'),
                           tk.get_validator('ignore_empty')],
            'update_freq': [tk.get_converter('convert_from_extras'),
                            tk.get_validator('ignore_empty')],
            # harvesting fields
            #'spatial_harvester': [tk.get_converter('convert_from_extras'),
            #                   tk.get_validator('ignore_missing')],
            #'harvest_object_id': [tk.get_converter('convert_from_extras'),
            #                   tk.get_validator('ignore_missing')],
            #'harvest_source_id': [tk.get_converter('convert_from_extras'),
            #                   tk.get_validator('ignore_missing')],
            #'harvest_source_title': [tk.get_converter('convert_from_extras'),
            #                   tk.get_validator('ignore_missing')],
        })
        return schema

    def _modify_package_schema(self, schema):
        # Add our custom_test metadata field to the schema, this one will use
        # convert_to_extras instead of convert_to_tags.
        # ignore_missing == optional
        # not_empty == mandatory, enforced here while modifying

        schema.update({
            'agency_program': [tk.get_validator('ignore_missing'),
                               tk.get_converter('convert_to_extras')],
            'contact_point': [tk.get_converter('convert_to_extras'),
                              tk.get_validator('not_empty')],
            'spatial_coverage': [tk.get_converter('convert_to_extras'),
                                 tk.get_validator('not_empty')],
            'granularity': [tk.get_converter('convert_to_extras'),
                            tk.get_validator('not_empty')],
            'jurisdiction': [tk.get_converter('convert_to_extras'),
                             tk.get_validator('not_empty')],
            'temporal_coverage': [tk.get_converter('convert_to_extras'),
                                  tk.get_validator('not_empty')],
            'data_state': [tk.get_converter('convert_to_extras'),
                           tk.get_validator('not_empty')],
            'update_freq': [tk.get_converter('convert_to_extras'),
                            tk.get_validator('not_empty')],
            # harvesting fields
            #'spatial_harvester': [tk.get_validator('ignore_missing'),
            #                   tk.get_converter('convert_to_extras')],
            #'harvest_object_id': [tk.get_validator('ignore_missing'),
            #                   tk.get_converter('convert_to_extras')],
            #'harvest_source_id': [tk.get_validator('ignore_missing'),
            #                   tk.get_converter('convert_to_extras')],
            #'harvest_source_title': [tk.get_validator('ignore_missing'),
            #                   tk.get_converter('convert_to_extras')],

        })
        return schema
