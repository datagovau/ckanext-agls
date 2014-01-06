This CKAN Extension customises a CKAN instance for the hosting of data.gov.au.

It comprises:

  * A path to local customisations of the core templates to include AGLS/Dublin Core minimum metadata
  * A custom n3/rdf output format

Installation
============

To install this package, from your CKAN virtualenv, run the following from your CKAN base folder (e.g. ``pyenv/``)::

  pip install -e git+https://github.com/okfn/ckanext-datagovau#egg=ckanext-datagovau

Then activate it by setting ``ckan.plugins = datagovau`` in your main ``ini``-file.

