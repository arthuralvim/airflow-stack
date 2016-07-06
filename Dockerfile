FROM ubuntu:trusty
MAINTAINER Arthur Alvim <afmalvim@gmail.com>

RUN apt-get update -yqq

RUN apt-get install -yqq --no-install-recommends \
    apt-utils\
    netcat \
    curl \
    vim \
    python-pip \
    python-dev \
    libkrb5-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    build-essential \
    locales \
    libblas-dev \
    liblapack-dev

RUN apt-get install -y libpq-dev

RUN pip install -U pip
RUN pip install setuptools
RUN pip install pytz==2015.7
RUN pip install cryptography
RUN pip install pyOpenSSL
RUN pip install ndg-httpsclient
RUN pip install pyasn1
RUN pip install psycopg2
RUN pip install pandas
RUN pip install sqlalchemy
RUN pip install greenlet
RUN pip install eventlet
RUN pip install gevent
RUN pip install python-decouple
RUN pip install ipython
RUN pip install ipdb
RUN pip install raven[flask]

ENV AIRFLOW_HOME /usr/local/airflow
ENV C_FORCE_ROOT true  # RUN AIRFLOW WORKER BY ROOT !!! (CHECK SIDE EFFECTS!)
RUN mkdir -p ${AIRFLOW_HOME}
RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow
ARG AIRFLOW_VERSION=1.7.0

RUN pip install airflow[s3,postgresql,rabbitmq,password,slack,celery]==$AIRFLOW_VERSION
RUN pip install airflow[async,hdfs,hive]==$AIRFLOW_VERSION

WORKDIR ${AIRFLOW_HOME}
ADD . .
RUN chown -R airflow: ${AIRFLOW_HOME}
RUN chmod +x ${AIRFLOW_HOME}/entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
