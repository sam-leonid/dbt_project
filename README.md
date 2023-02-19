### HW4


# 1. What is the count of records in the model fact_trips after running all models with the test run variable disabled and filtering for 2019 and 2020 data only (pickup datetime)

Add to where in `stg_green_tripdata.sql` and `stg_yellow_tripdata.sql` cond: 
`and EXTRACT(year  FROM cast(*_pickup_datetime as timestamp)) IN (2019, 2020)`

`dbt build --var 'is_test_run : false'`

Result: `61648442`

# 2. What is the distribution between service type filtering by years 2019 and 2020 data as done in the videos . (Yellow/Green)

Using data studio I plot diagram of the distribution between service types

Result: `89.9/10.1`

# 3. What is the count of records in the model stg_fhv_tripdata after running all models with the test run variable disabled

I create stg_fhv_tripdata, add desc to schema.yml and delete the condition `where rn = 1`

Result: `43244696`

# 4. 
