#!/usr/bin/env bash

docker-compose up -d database queue
docker-compose up -d web
docker-compose up -d worker scheduler flower
