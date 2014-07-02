from __future__ import print_function
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

        # if table empty, fill with data.
        with open(os.path.dirname(__file__) + '/gazetteer.2012.csv', 'rb') as csvfile:
            reader = csv.reader(csvfile)
            log.info("table empty, fill with data.")
            header = None
            y = 0
            for row in reader:
                if not header:
                    header = row
                else:
                    values = {}
                    x = 0
                    for data in row:

                        values[header[x].lower()] = data
                        x += 1
                    #log.info(values)
                    #log.info(y)
                    if values['feat_code'] == 'URBN' or values['feat_code'] == 'LOCB' or values['feat_code'] == 'LOCU':
                        agls_model.add_data(values)
                    y += 1
                    if y % 1000 == 0:
                        print(y)
                    elif y % 100 == 0:
                        print('*', end='')
                    elif y % 10 == 0:
                        print('.', end='')
            print("done")