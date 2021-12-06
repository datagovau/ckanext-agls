# -*- coding: utf-8 -*-

import ckan.lib.base as base
import ckan.lib.helpers as h
import ckan.lib.render
import ckan.logic as logic
import ckan.model as model
from ckan.common import _, c, response
from ckan.controllers.package import PackageController


NotFound = logic.NotFound
NotAuthorized = logic.NotAuthorized
ValidationError = logic.ValidationError


class AGLSController(PackageController):
    def gmd(self, id):
        format = "html"

        # response.headers['Content-Type'] = ctype
        response.headers[
            "Content-Type"
        ] = "application/vnd.iso.19139+xml; charset=utf-8".encode("ISO-8859-1")
        response.headers["Content-Disposition"] = (
            "attachment; filename=" + id + ".xml"
        ).encode("ISO-8859-1")
        package_type = self._get_package_type(id.split("@")[0])
        context = {
            "model": model,
            "session": model.Session,
            "user": c.user or c.author,
            "for_view": True,
            "auth_user_obj": c.userobj,
        }
        data_dict = {"id": id}

        # interpret @<revision_id> or @<date> suffix
        split = id.split("@")
        if len(split) == 2:
            data_dict["id"], revision_ref = split
            if model.is_id(revision_ref):
                context["revision_id"] = revision_ref
            else:
                try:
                    date = h.date_str_to_datetime(revision_ref)
                    context["revision_date"] = date
                except TypeError as e:
                    base.abort(400, _("Invalid revision format: %r") % e.args)
                except ValueError as e:
                    base.abort(400, _("Invalid revision format: %r") % e.args)
        elif len(split) > 2:
            base.abort(400, _("Invalid revision format: %r") % 'Too many "@" symbols')

        # check if package exists
        try:
            c.pkg_dict = logic.get_action("package_show")(context, data_dict)
            c.pkg = context["package"]
        except NotFound:
            base.abort(404, _("Dataset not found"))
        except NotAuthorized:
            base.abort(401, _("Unauthorized to read package %s") % id)

        # used by disqus plugin
        c.current_package_id = c.pkg.id

        # can the resources be previewed?
        for resource in c.pkg_dict["resources"]:
            resource["can_be_previewed"] = self._resource_preview(
                {"resource": resource, "package": c.pkg_dict}
            )

        self._setup_template_variables(context, {"id": id}, package_type=package_type)
        template = "package/read.gmd"

        try:
            return base.render(template, extra_vars={"dataset_type": package_type})
        except ckan.lib.render.TemplateNotFound:
            msg = _(
                "Viewing {package_type} datasets in {format} format is "
                "not supported (template file {file} not found).".format(
                    package_type=package_type, format=format, file=template
                )
            )
            base.abort(403, msg)

        assert False, "We should never get here"
