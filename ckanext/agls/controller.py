
from ckan.common import _, request, c, response
from ckan.controllers.package import PackageController
import ckan.logic as logic

import ckan.model as model

import ckan.lib.helpers as h
import ckan.lib.render

import ckan.lib.base as base
import ckan.lib.jsonp as jsonp
import requests
NotFound = logic.NotFound
NotAuthorized = logic.NotAuthorized
ValidationError = logic.ValidationError
from pylons import config


class AGLSController(PackageController):
    @jsonp.jsonpify
    def geo_autocomplete(self):
        q = request.params.get('q', '')
        rows = config.get('ckan.agls.gazetter_rows') or '200'
        record_list = []
        if q:
            r = requests.get("http://www.ga.gov.au/gazetteer-search/gazetteer2012/select/?q=name:*"+q+"*"\
                             "&rows="+rows+"&fq=feature_code:POPL or feature_code:LOCB or feature_code:SUB or feature_code:URBN or feature_code:STAT or feature_code:CONT").json()
            for record in r['response']['docs']:
                if record.get('authority_id') != 'AHO':
                    result_dict = {'name': record.get('id')+": "+record.get('name')}
                    record_list.append(result_dict)
        return record_list

    @jsonp.jsonpify
    def geo_latlon(self):
        q = request.params.get('q', '')
        limit = request.params.get('limit', 1)
        record_list = []
        if q:
            r = requests.get("http://www.ga.gov.au/gazetteer-search/gazetteer2012/select/?q=id:"+q).json()

            for record in r['response']['docs']:
                locationParts = record['location'].split(',')
                latitude = locationParts[0]
                longitude = locationParts[1]
                result_dict = {'id': record.get('id'),
                               'name': record.get('id')+": "+record.get('name'),
                               'latitude': latitude,
                               'longitude': longitude,
                               'geojson': '{"type": "Point","coordinates": ['+ longitude+ ','+latitude+']}'}
                return result_dict
        return {}

    def gmd(self, id):
        format = 'html'

        # response.headers['Content-Type'] = ctype
        response.headers['Content-Type'] = 'application/vnd.iso.19139+xml; charset=utf-8'.encode("ISO-8859-1")
        response.headers["Content-Disposition"] = ("attachment; filename=" + id + ".xml").encode("ISO-8859-1")
        package_type = self._get_package_type(id.split('@')[0])
        context = {'model': model, 'session': model.Session,
                   'user': c.user or c.author, 'for_view': True,
                   'auth_user_obj': c.userobj}
        data_dict = {'id': id}

        # interpret @<revision_id> or @<date> suffix
        split = id.split('@')
        if len(split) == 2:
            data_dict['id'], revision_ref = split
            if model.is_id(revision_ref):
                context['revision_id'] = revision_ref
            else:
                try:
                    date = h.date_str_to_datetime(revision_ref)
                    context['revision_date'] = date
                except TypeError, e:
                    base.abort(400, _('Invalid revision format: %r') % e.args)
                except ValueError, e:
                    base.abort(400, _('Invalid revision format: %r') % e.args)
        elif len(split) > 2:
            base.abort(400, _('Invalid revision format: %r') %
                       'Too many "@" symbols')

        # check if package exists
        try:
            c.pkg_dict = logic.get_action('package_show')(context, data_dict)
            c.pkg = context['package']
        except NotFound:
            base.abort(404, _('Dataset not found'))
        except NotAuthorized:
            base.abort(401, _('Unauthorized to read package %s') % id)

        # used by disqus plugin
        c.current_package_id = c.pkg.id

        # can the resources be previewed?
        for resource in c.pkg_dict['resources']:
            resource['can_be_previewed'] = self._resource_preview(
                {'resource': resource, 'package': c.pkg_dict})

        self._setup_template_variables(context, {'id': id},
                                       package_type=package_type)
        template = 'package/read.gmd'

        try:
            return base.render(template, extra_vars={'dataset_type': package_type})
        except ckan.lib.render.TemplateNotFound:
            msg = _("Viewing {package_type} datasets in {format} format is "
                    "not supported (template file {file} not found).".format(
                package_type=package_type, format=format, file=template))
            base.abort(403, msg)

        assert False, "We should never get here"
