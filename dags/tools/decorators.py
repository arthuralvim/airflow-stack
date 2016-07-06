# -*- coding: utf-8 -*-

from airflow.operators.python_operator import PythonOperator


def operator(dag, task_id, **kwargs):
    def decorator(fn):
        operator = PythonOperator(
            dag=dag,
            task_id=task_id,
            python_callable=fn,
            **kwargs)
        return operator
    return decorator
