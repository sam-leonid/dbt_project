

with fhv_data as (
    select *, 
        'fhv' as service_type
    from `zoom-camp-hw3`.`dbt_lsamortsev`.`stg_fhv_tripdata`
    where EXTRACT(year  FROM cast(pickup_datetime as timestamp)) = 2019
          and pickup_locationid is not null and dropoff_locationid is not null 
),

dim_zones as (
    select * from `zoom-camp-hw3`.`dbt_lsamortsev`.`dim_zones`
    where borough != 'Unknown'
)
select 
    fhv_data.service_type,
    fhv_data.pickup_locationid,
    fhv_data.dispatching_base_num,
    fhv_data.sr_flag,
    fhv_data.affiliated_base_number,
    pickup_zone.borough as pickup_borough,
    pickup_zone.zone as pickup_zone,
    fhv_data.dropoff_locationid,
    dropoff_zone.borough as dropoff_borough,
    dropoff_zone.zone as dropoff_zone,
    fhv_data.pickup_datetime,
    fhv_data.dropoff_datetime
from fhv_data
inner join dim_zones as pickup_zone
on fhv_data.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on fhv_data.dropoff_locationid = dropoff_zone.locationid