import logging
import datetime
import os

from pylons import config

from ckan.lib.cli import CkanCommand
import csv
import agls_model
# No other CKAN imports allowed until _load_config is run,
# or logging is disabled


class InitDB(CkanCommand):
    """Initialise the extension's database tables
    """
    summary = __doc__.split('\n')[0]
    usage = __doc__
    max_args = 0
    min_args = 0

    def command(self):
        self._load_config()

        import ckan.model as model
        model.Session.remove()
        model.Session.configure(bind=model.meta.engine)
        log = logging.getLogger('ckanext.agls')

        import agls_model
        agls_model.init_tables()
        log.info("DB tables are setup")

        # TODO if table empty, fill with data.

        with open('gazetteer.2012.csv', 'rb') as csvfile:
            reader = csv.reader(csvfile)
            header = None
            x = 0
            for row in reader:
                if not header:
                    header = row
                else:
                    values = {}
                    x = 0
                    for data in row:
                        values[header[x].lower()] = data
                        x = x + 1
                    agls_model.add_data(values)