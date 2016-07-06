# -*- coding: utf-8 -*-

from airflow.models import DAG
from tools.settings import DEFAULT_ARGS
from tools.decorators import operator


default_args = DEFAULT_ARGS.copy()
dag = DAG(dag_id='hello-world',
          default_args=default_args)


@operator(dag, task_id='primeiro-passo')
def primeiro_passo():
    return 1


@operator(dag, task_id='segundo-passo')
def segundo_passo():
    return 2


@operator(dag, task_id='terceiro-passo')
def terceiro_passo():
    return 3


segundo_passo.set_upstream(primeiro_passo)
terceiro_passo.set_upstream(segundo_passo)
