select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        pickup_datetime as value_field,
        count(*) as n_records

    from `zoom-camp-hw3`.`dbt_lsamortsev`.`stg_green_tripdata`
    group by pickup_datetime

)

select *
from all_values
where value_field not in (
    2019,2020
)



      
    ) dbt_internal_test