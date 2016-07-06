# airflow-stack

Running Airflow with Docker.

All images are official. You can find them in [Docker Hub](https://hub.docker.com/).


## Copy .env-example to .env and set these variables:

```bash
$ cp .env-example .env
```

```bash
POSTGRES_USER=airflow
POSTGRES_PASSWORD=airflow
POSTGRES_DB=airflow
RABBITMQ_DEFAULT_USER=airflow
RABBITMQ_DEFAULT_PASS=airflow
RABBITMQ_DEFAULT_VHOST=airflow
```

## Downloading Images:

```bash
$ docker pull rabbitmq:3.6-management
$ docker pull postgres:latest
$ docker build -t airflow .
```
or
```bash
$ docker-compose build .
```

## Mounting and Running Images:

### Full Running Example:

```bash
$ docker-compose up -d queue database
$ docker-compose up -d web
$ docker-compose up -d worker flower
# Open <docker-machine IP>:8080 (Airflow Web UI)
# Open <docker-machine IP>:8081 (RabbitMQ Management Web UI)
# Open <docker-machine IP>:5757 (Airflow Flower)
```

Looking for more options? Check this [here](http://pythonhosted.org/airflow/cli.html)!

#### Airflow Database Setup
```bash
$ docker exec -it [container-name] airflow initdb
```

#### Run Shell (Bash) in Airflow as Root
```bash
$ docker exec -it --user=root [container-name] /bin/bash
```

#### Removing Airflow Data
```bash
$ docker exec -it [container-name] resetdb -y
```

#### Airflow Variables
```bash
$ docker exec -it [container-name] variables -j=True
```

#### Airflow Version
```bash
$ docker exec -it [container-name] version
```

#### List DAGs
```bash
$ docker exec -it [container-name] list_dags
```
