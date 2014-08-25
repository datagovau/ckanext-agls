import ckanapi # download from https://github.com/ckan/ckanapi and include in your scraper repo
import re

source = ckanapi.RemoteCKAN("http://data.gov.au/")
destination = ckanapi.RemoteCKAN("http://localhost:5000", "72f42cf7-84bf-45ad-9270-41c92bdbb334")

for org_dict in source.action.organization_list(all_fields=True):
    print "loading "+org_dict['title']
    del org_dict['id']
    del org_dict['revision_id']
    del org_dict['packages']
    try:
        org = destination.call_action('organization_create', org_dict)  # create a new dataset?
        print org['id'] + " created"
    except ckanapi.ValidationError, e:
        print org_dict
        print e
        #raise StandardError(e)
        pass
    except ckanapi.NotAuthorized:
        raise StandardError('Access denied, check your CKAN API Key is correct')
        pass