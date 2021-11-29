This CKAN Extension customises a CKAN instance for the hosting of data.gov.au.

It comprises:

  * A path to local customisations of the core templates to include AGLS/Dublin Core minimum metadata
  * A custom n3/rdf output format

Installation
============

To install this package, from your CKAN virtualenv, run the following from your CKAN base folder (e.g. ``pyenv/``)::

  pip install -e git+https://github.com/datagovau/ckanext-agls#egg=ckanext-agls

Then activate it by setting ``ckan.plugins = agls`` in your main ``ini``-file.

Configuration
=============

Set configuration options in ini file::

  ckan.plugins = agls scheming_datasets

  ckan.agls.gazetter_rows = the number of returned search results of Geospatial Coverage or 200 on default

  scheming.dataset_schemas = ckanext.agls:ckan_dataset.json

  scheming.presets = ckanext.agls:agls_presets.json
				     ckanext.scheming:presets.json

Notes
===========
https://github.com/geonetwork/schema-plugins/blob/master/iso19139.anzlic/templates/ANZLICMinimum.xml