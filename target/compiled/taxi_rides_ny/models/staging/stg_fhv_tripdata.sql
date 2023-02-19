

with tripdata as 
(
  select *,
    row_number() over(partition by pickup_datetime) as rn
  from `zoom-camp-hw3`.`trips_data_all`.`fhv_tripdata`
)
select
    -- identifiers
    to_hex(md5(cast(coalesce(cast(pickup_datetime as 
    string
), '') as 
    string
))) as tripid,
    cast(PUlocationID as integer) as  pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    cast(dispatching_base_num as string) as dispatching_base_num,
    cast(SR_Flag as string) as sr_flag,
    cast(Affiliated_base_number as string) as affiliated_base_number,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
from tripdata


-- dbt build --m <model.sql> --var 'is_test_run: false'
