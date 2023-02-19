
    
    

with all_values as (

    select
        pickup_datetime as value_field,
        count(*) as n_records

    from `zoom-camp-hw3`.`dbt_lsamortsev`.`stg_yellow_tripdata`
    group by pickup_datetime

)

select *
from all_values
where value_field not in (
    2019,2020
)


