# -*- coding: utf-8 -*-

import requests

from flask import Blueprint, jsonify, make_response

import ckan.lib.base as base
import ckan.model as model
import ckan.plugins.toolkit as tk
import ckan.views.dataset as dataset
from . import utils

agls = Blueprint("agls", __name__)


def get_blueprints():
    return [agls]


def gmd(id, package_type="dataset"):
    format = "html"

    context = {
        "model": model,
        "session": model.Session,
        "user": tk.c.user or tk.c.author,
        "for_view": True,
        "auth_user_obj": tk.c.userobj,
    }
    data_dict = {"id": id}
    # check if package exists
    try:
        pkg_dict = tk.get_action("package_show")(context, data_dict)
        pkg = context["package"]
    except tk.ObjectNotFound:
        return tk.abort(404, tk._("Dataset not found"))
    except tk.NotAuthorized:
        return tk.abort(401, tk._("Unauthorized to read package %s") % id)

    dataset._setup_template_variables(context, {"id": id}, package_type)
    template = "package/read.gmd"
    extra_vars = {"dataset_type": package_type, "pkg": pkg, "pkg_dict": pkg_dict}

    try:
        response = make_response(base.render(template, extra_vars))
    except base.TemplateNotFound:
        msg = tk._(
            "Viewing {package_type} datasets in {format} format is "
            "not supported (template file {file} not found).".format(
                package_type=package_type, format=format, file=template
            )
        )
        return tk.abort(403, msg)
    response.headers["Content-Type"] = "application/vnd.iso.19139+xml; charset=utf-8"
    response.headers["Content-Disposition"] = "attachment; filename=" + id + ".xml"
    return response


def geo_autocomplete():
    q = tk.request.args.get("q", "")
    rows = tk.config.get("ckan.agls.gazetter_rows") or "200"
    record_list = []
    if q:
        r = requests.get(
            "http://www.ga.gov.au/gazetteer-search/gazetteer2012/select/?q=name:*"
            + q
            + "*"
            "&rows="
            + rows
            + "&fq=feature_code:POPL or feature_code:LOCB or feature_code:SUB or feature_code:URBN or feature_code:STAT or feature_code:CONT"
        ).json()
        for record in r["response"]["docs"]:
            if record.get("authority_id") != "AHO":
                result_dict = {"name": record.get("id") + ": " + record.get("name")}
                record_list.append(result_dict)
    return jsonify(record_list)


def geo_latlon():
    q = tk.request.args.get("q", "")
    record_list = []
    if q:
        return utils.details_for_gaz_id(q)
    return {}


agls.add_url_rule("/<package_type>/<id>/gmd", view_func=gmd)
agls.add_url_rule(
    "/api/2/util/gazetteer/autocomplete", view_func=geo_autocomplete,
)
agls.add_url_rule(
    "/api/2/util/gazetteer/latlon", view_func=geo_latlon,
)
