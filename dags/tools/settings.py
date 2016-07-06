# -*- coding: utf-8 -*-

from datetime import timedelta, datetime


DEFAULT_ARGS = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2016, 4, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}
