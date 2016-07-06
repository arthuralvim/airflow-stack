#!/usr/bin/env bash

CMD="airflow"

if [ "$1" = "webserver" ]; then
    echo "--> Initializing Database..."
    $CMD initdb
    echo "--> Creating User..."
    python create-admin.py
fi

exec $CMD "$@"
