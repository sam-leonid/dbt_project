


select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone
from `zoom-camp-hw3`.`dbt_lsamortsev`.`taxi_zone_lookup`