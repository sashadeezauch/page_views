##### GLOBAL IMPORT
from typing import Any

from airflow import DAG
from general import *

##### DAG DEFINITION and DAG PARAMETERS
# >> This is just an example and can differ in different temple types
dag_folder = os.path.dirname(os.path.realpath(__file__))

default_args = {
    'owner': 'Checkout.com',
    'retries': 1,
    'catchup': False,
    'retry_delay': timedelta(minutes=2),
    'start_date': datetime(2020, 12, 9)
}

dag = DAG('pageview_postcode',
          schedule_interval='0 */4 * * *',
          max_active_runs=1,
          catchup=False,
          default_args=default_args
          )


##### DAG schedules (tasks)

pageviews_postcode = SQLTemplatedPythonOperator(task_id='pageviews_postcode',provide_context=True,
  templates_dict={'sql_file': dag_folder+'/page_views/pageviews_postcode.sql','dbEngine':'PG','dbHook':getDBHook('SNOWFLAKE','MASTER'),'sql_param_abc': '5 days'},dag=dag,)

pageviews_postcode_snapshot = SQLTemplatedPythonOperator(task_id='pageviews_postcode_snapshot',provide_context=True,
  templates_dict={'sql_file': dag_folder+'/page_views/pageviews_postcode_snapshot.sql','dbEngine':'PG','dbHook':getDBHook('SNOWFLAKE','MASTER'),'sql_param_abc': '5 days'},dag=dag,)

