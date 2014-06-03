import ckan.plugins as p
from ckan.lib.base import BaseController, config
from ckan.common import OrderedDict, _, json, request, c, g, response
from ckan.controllers.package import PackageController
import ckan.logic as logic

import ckan.model as model

import ckan.lib.package_saver as package_saver
import ckan.lib.helpers as h
import ckan.lib.render


from genshi.template import MarkupTemplate
from genshi.template.text import NewTextTemplate
import ckan.lib.base as base
NotFound = logic.NotFound
NotAuthorized = logic.NotAuthorized
ValidationError = logic.ValidationError

class AGLSController(PackageController):


    def gmd(self, id):
        format = 'html'
        if not format == 'html':
            ctype, extension, loader = \
                self._content_type_from_extension(format)
            if not ctype:
                # An unknown format, we'll carry on in case it is a
                # revision specifier and re-constitute the original id
                id = "%s.%s" % (id, format)
                ctype, format, loader = "text/html; charset=utf-8", "html", \
                                        MarkupTemplate
        else:
            ctype, format, loader = self._content_type_from_accept()

        #response.headers['Content-Type'] = ctype
        response.headers['Content-Type'] = 'application/vnd.iso.19139+xml'
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
        c.related_count = c.pkg.related_count

        # can the resources be previewed?
        for resource in c.pkg_dict['resources']:
            resource['can_be_previewed'] = self._resource_preview(
                {'resource': resource, 'package': c.pkg_dict})

        self._setup_template_variables(context, {'id': id},
                                       package_type=package_type)

        package_saver.PackageSaver().render_package(c.pkg_dict, context)

        template = 'package/read.gmd'

        try:
            return base.render(template, loader_class=loader)
        except ckan.lib.render.TemplateNotFound:
            msg = _("Viewing {package_type} datasets in {format} format is "
                    "not supported (template file {file} not found).".format(
                package_type=package_type, format=format, file=template))
            base.abort(403, msg)

        assert False, "We should never get here"

        #return p.toolkit.render('package/read.gmd.xml', loader_class=MarkupTemplate)