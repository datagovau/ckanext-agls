import ckanapi # download from https://github.com/ckan/ckanapi and include in your scraper repo
import re
from time import strftime
ckan = ckanapi.RemoteCKAN("http://localhost:5000", "72f42cf7-84bf-45ad-9270-41c92bdbb334")
def get_pkg_dict_extra(pkg_dict, key, default=None):
    '''Returns the value for the dataset extra with the provided key.

    If the key is not found, it returns a default value, which is None by
    default.

    :param pkg_dict: dictized dataset
    :key: extra key to lookup
    :default: default value returned if not found
    '''

    extras = pkg_dict['extras'] if 'extras' in pkg_dict else []

    for extra in extras:
        if extra['key'] == key:
            return extra['value']

    return default
import csv
data = {}
with open('Organisation to Jurisdiction for Gazetteer.csv', 'rb') as csvfile:
    reader = csv.reader(csvfile)
    header = None
    x = 0
    for row in reader:
        if not header:
            header = row
        else:
            pkg_dict = {}
            y = 0
            org_name = ""
            org_jurisdiction = ""
            org_spatial = ""
            for col in row:
                if header[y] == 'Organisation':
                    org_name = col.strip()

                elif header[y] == 'Jurisdiction':
                    org_jurisdiction = col.strip()

                elif header[y] == 'Gazetteer Link':
                    org_spatial = col.strip()
                y += 1
            x += 1
            print(org_name)
            print(x)
            data[org_name]= {'org_jurisdiction':org_jurisdiction, 'org_spatial':org_spatial}

    for org in ckan.action.organization_list(all_fields=True, include_extras=True):
            if org['title'] in data:
                print("Found "+org['title'])
                del org['packages']
                update = False
                if not 'extras' in org:
                    org['extras'] = []
                if not get_pkg_dict_extra(org, 'jurisdiction'):
                    update = True
                    org['extras'].append({'key': 'jurisdiction', 'value': data[org['title']]['org_jurisdiction']})

                if not get_pkg_dict_extra(org, 'spatial_coverage'):
                    update = True
                    org['extras'].append({'key': 'spatial_coverage', 'value': data[org['title']]['org_spatial']})
                try:
                    if update:
                        pkg = ckan.call_action('organization_update', org)  # create a new dataset?
                        print(org['name'] + " updated")
                except ckanapi.ValidationError as e:
                    print(org)
                    print(e)
                    if len(e.error_dict) == 2 and 'name' in e.error_dict and e.error_dict['name'][0] == 'That URL is already in use.':
                        pass
                    else:
                        raise Exception(e)
                except ckanapi.NotAuthorized:
                    raise Exception('Access denied, check your CKAN API Key is correct')