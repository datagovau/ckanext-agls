# -*- coding: utf-8 -*-

from __future__ import print_function

import datetime
import json
import logging
import os

import ckan.model as model
import ckan.plugins as p
import ckan.plugins.toolkit as tk
from shapely.geometry import asShape

import ckanext.agls.views as views
import ckanext.agls.utils as utils

log = logging.getLogger(__name__)



def custom_output_validator(key, data, errors, context):
    value = data.get(key)
    value = (
        value.replace("{", "")
        .replace("}", "")
        .replace(',"', ", ")
        .replace('"', "")
        .replace(",", ", ")
    )
    data[key] = value


def get_group_select_list():
    result = []
    user = tk.get_action("get_site_user")({"ignore_auth": True}, {})
    context = {"user": user["name"]}
    groups = tk.get_action("group_list")(context, {})

    for group in groups:
        result.append({"value": group})
    return result


def group_id():
    id = tk.request.args.get("group") or tk.request.args.get("groups__0__id")
    return id

def groups():
    query = model.Group.all(group_type="group")

    def convert_to_dict(user):
        out = {}
        for k in ["id", "name", "title"]:
            out[k] = getattr(user, k)
        return out

    out = map(convert_to_dict, query.all())
    return out


def spatial_bound(spatial_str):
    if spatial_str and spatial_str != "":
        spatial_dict = json.loads(spatial_str)
        return asShape(spatial_dict).bounds
    return None


def get_user_full(username):
    try:
        return tk.get_action("user_show")(
            {"return_minimal": True, "keep_sensitive_data": True, "keep_email": True},
            {"id": username},
        )
    except tk.ObjectNotFound:
        return None


def get_org_full(id):
    try:
        return tk.get_action("organization_show")(
            {"include_datasets": False}, {"id": id}
        )
    except tk.ObjectNotFound:
        return None


def is_site(site_name):
    result = site_name in tk.config.get("ckan.site_url", "")
    return result


def get_now():
    return datetime.datetime.now().strftime("%Y-%M-%d")


def iso_languages_list():
    return tk.config.get("iso638.2")


class AGLSDatasetPlugin(p.SingletonPlugin, tk.DefaultDatasetForm):
    p.implements(p.IConfigurer, inherit=False)
    p.implements(p.ITemplateHelpers)
    p.implements(p.IBlueprint)
    p.implements(p.IValidators)

    # IBlueprint

    def get_blueprint(self):
        return views.get_blueprints()

    # ITemplateHelpers

    def get_helpers(self):
        return {
            "fields_of_research": utils.fields_of_research,
            "geospatial_topics": utils.geospatial_topics,
            "fields_theme": utils.fields_theme,
            "get_group_select_list": get_group_select_list,
            "spatial_bound": spatial_bound,
            "get_user_full": get_user_full,
            "get_org_full": get_org_full,
            "groups": groups,
            "group_id": group_id,
            "is_site": is_site,
            "get_now": get_now,
            "iso_languages_list": iso_languages_list,
        }

    def get_validators(self):
        return {"custom_output_validator": custom_output_validator}

    def update_config(self, config):
        tk.add_template_directory(config, "templates")
        tk.add_public_directory(config, "theme/public")
        tk.add_public_directory(config, "fanstatic/ckanext-agls")
        tk.add_resource("fanstatic", "ckanext-agls")

        here = os.path.dirname(__file__)

        with open(os.path.join(here, "languages.json")) as languages:
            config["iso638.2"] = json.load(languages)
        # config['licenses_group_url'] = 'http://%(ckan.site_url)/licenses.json'
