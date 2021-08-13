
    
    



select count(*) as validation_errors
from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_customer`
where customer_sk is null


