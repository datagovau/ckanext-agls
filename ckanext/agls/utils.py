import os
import csv
import logging

import requests

import ckan.model as model
import ckan.plugins.toolkit as tk


log = logging.getLogger(__name__)


def create_geospatial_topics():
    user = tk.get_action("get_site_user")({"ignore_auth": True}, {})
    context = {"user": user["name"], "ignore_auth": True}
    vocab = model.Vocabulary.get("geospatial_topics")
    if not vocab:
        data = {"name": "geospatial_topics"}
        vocab = tk.get_action("vocabulary_create")(context, data)
        for tag in (
            "Farming",
            "Biota",
            "Boundaries",
            "Climatology Meteorology and Atmosphere",
            "Economy",
            "Elevation",
            "Environment",
            "Geoscientific information",
            "Health",
            "Imagery base maps and Earth cover",
            "Intelligence and Military",
            "Inland waters",
            "Location",
            "Oceans",
            "Planning and Cadastre",
            "Society",
            "Transportation",
            "Utilities and Communication",
        ):
            data = {"name": tag, "vocabulary_id": vocab["id"]}
            tk.get_action("tag_create")(context, data)


def create_fields_of_research():

    user = tk.get_action("get_site_user")({"ignore_auth": True}, {})
    context = {"user": user["name"], "ignore_auth": True}
    vocab = model.Vocabulary.get("fields_of_research")
    if not vocab:
        print("Loading ABS Fields of Research for the first time, please wait...")
        data = {"name": "fields_of_research"}
        vocab = tk.get_action("vocabulary_create")(context, data)
        with open(
            os.path.dirname(os.path.abspath(__file__)) + "/ABS Fields Of Research.csv",
            "r",
        ) as csvfile:
            forcsv = csv.reader(csvfile)
            for row in forcsv:
                data = {
                    "name": row[1].strip().replace(",", "")[:100],
                    "vocabulary_id": vocab["id"],
                }
                tk.get_action("tag_create")(context, data)
        print("ABS Fields of Research loaded")


def create_fields_theme():
    user = tk.get_action("get_site_user")({"ignore_auth": True}, {})
    context = {"user": user["name"], "ignore_auth": True}
    vocab = model.Vocabulary.get("fields_theme")
    if not vocab:
        log.info("Loading Fields Theme for the first time, please wait...")
        data = {"name": "fields_theme"}
        vocab = tk.get_action("vocabulary_create")(context, data)
        log.info("Success create vocab")
        for tag in (
            "Law and Order",
            "Education and Training",
            "Health",
            "Social and Community Services",
            "Recreation and Culture",
            "Primary Industries",
            "Business and Industrial Development",
            "Government Administration",
            "Finance",
            "Land and Resource Management",
            "Infrastructure and Communications",
            "Conservation and Environment",
            "Labour",
            "Emergency Management",
        ):
            data = {"name": tag, "vocabulary_id": vocab["id"]}
            tk.get_action("tag_create")(context, data)
            log.info("tag_create = %s", data)


def geospatial_topics():
    create_geospatial_topics()
    tag_list = tk.get_action("tag_list")
    geospatial_topics = tag_list(data_dict={"vocabulary_id": "geospatial_topics"})
    return geospatial_topics


def fields_of_research():
    create_fields_of_research()
    tag_list = tk.get_action("tag_list")
    fields_of_research = tag_list(
        data_dict={"vocabulary_id": "fields_of_research", "all_fields": False}
    )
    return fields_of_research


def fields_theme():
    create_fields_theme()

    tag_list = tk.get_action("tag_list")
    fields_theme = tag_list(
        data_dict={"vocabulary_id": "fields_theme", "all_fields": False}
    )
    return fields_theme


def details_for_gaz_id(id_):
    r = requests.get(
        "http://www.ga.gov.au/gazetteer-search/gazetteer2012/select/?q=id:" + id_
    ).json()

    for record in r["response"]["docs"]:
        locationParts = record["location"].split(",")
        latitude = locationParts[0]
        longitude = locationParts[1]
        result_dict = {
            "id": record.get("id"),
            "name": record.get("id") + ": " + record.get("name"),
            "latitude": latitude,
            "longitude": longitude,
            "geojson": '{"type": "Point","coordinates": ['
            + longitude
            + ","
            + latitude
            + "]}",
        }
        return result_dict
