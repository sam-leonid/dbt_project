{{ config(materialized='view') }}

with tripdata as 
(
  select *,
    row_number() over(partition by pickup_datetime) as rn
  from {{ source('staging','fhv_tripdata') }}
)
select
    -- identifiers
    {{ dbt_utils.surrogate_key(['pickup_datetime']) }} as tripid,
    cast(PUlocationID as integer) as  pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    cast(dispatching_base_num as string) as dispatching_base_num,
    cast(SR_Flag as string) as sr_flag,
    cast(Affiliated_base_number as string) as affiliated_base_number,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
from tripdata
where rn = 1 


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
