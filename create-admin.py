#!/bin/python

from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser
from decouple import config
session = settings.Session()
exists = session.query(
    models.User).filter(
        models.User.username == config('AIRFLOW_ADMIN_PASSWORD', 'admin')) \
    .scalar()

if exists:
    print 'User already exists!'
else:
    user = PasswordUser(models.User())
    user.username = config('AIRFLOW_ADMIN_PASSWORD', 'admin')
    user.email = config('AIRFLOW_ADMIN_EMAIL', 'admin@admin.com')
    user.password = config('AIRFLOW_ADMIN_PASSWORD', 'admin')
    user.is_superuser = True
    session.add(user)
    session.commit()
    session.close()
