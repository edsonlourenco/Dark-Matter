from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime

dag = DAG('simples-dag-1', description='Simple DAG example',
          schedule_interval=None, start_date=datetime(2025, 2, 26),
          catchup=False)

task1 = BashOperator(task_id='task1', bash_command="sleep 5", dag=dag)
task2 = BashOperator(task_id='task2', bash_command="sleep 5", dag=dag)

task1 >> task2