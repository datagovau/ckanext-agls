This CKAN Extension customises a CKAN instance for the hosting of data.gov.au.

It comprises:

  * A path to local customisations of the core templates to include AGLS/Dublin Core minimum metadata
  * A custom n3/rdf output format

Installation
============

To install this package, from your CKAN virtualenv, run the following from your CKAN base folder (e.g. ``pyenv/``)::

  pip install -e git+https://github.com/datagovau/ckanext-agls#egg=ckanext-agls

Then activate it by setting ``ckan.plugins = agls`` in your main ``ini``-file.

Notes
===========

https://github.com/geonetwork/schema-plugins/blob/master/iso19139.anzlic/templates/ANZLICMinimum.xml