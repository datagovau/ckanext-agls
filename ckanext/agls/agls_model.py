import re
import uuid

from sqlalchemy import Table, Column, MetaData, ForeignKey
from sqlalchemy import types
from sqlalchemy.sql import select
from sqlalchemy.orm import mapper, relation
from sqlalchemy import func

import ckan.model as model
from ckan.lib.base import *
log = __import__('logging').getLogger(__name__)

metadata = MetaData()


class AGLS_Gazetteer(object):
    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)


gaz_table = Table('refdata_gazetteer', metadata,
                  Column('objectid', types.BigInteger, primary_key=True),
                  Column('record_id', types.UnicodeText),
                  Column('name', types.UnicodeText),
                  Column('feat_code', types.UnicodeText),
                  #Column('cgdn', types.UnicodeText),
                  #Column("authority_id", types.UnicodeText),
                  Column("concise_gaz", types.UnicodeText),
                  Column("latitude", types.Numeric),
                  #Column("lat_degrees", types.Integer),
                  #Column("lat_minutes", types.Integer),
                  #Column("lat_seconds", types.Integer),
                  Column("longitude", types.Numeric),
                  #Column("long_degrees", types.Integer),
                  #Column("long_minutes", types.Integer),
                  #Column("long_seconds", types.Integer),
                  #Column("postcode", types.UnicodeText),
                  Column("state_id", types.UnicodeText),
                  Column("status", types.UnicodeText),
                  Column("variant_name", types.UnicodeText),
                  #Column("map_100k", types.UnicodeText),
                  Column("place_id", types.Integer)
)
mapper(AGLS_Gazetteer, gaz_table)


def init_tables():
    metadata.create_all(model.meta.engine)


cached_tables = {}


def get_table(name):
    if name not in cached_tables:
        meta = MetaData()
        meta.reflect(bind=model.meta.engine)
        table = meta.tables[name]
        cached_tables[name] = table
    return cached_tables[name]


def add_data(values):

    q = model.Session.query(AGLS_Gazetteer).filter(AGLS_Gazetteer.objectid == values['objectid'])
    if q.count() == 0:
        log.info(values['objectid'] + ' is new')
        #print "new"
        #print values
        model.Session.add(AGLS_Gazetteer(**values))
        model.Session.commit()
    else:
        #print "old"
        log.info(values['objectid'] + ' already done')