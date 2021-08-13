
    
    



select count(*) as validation_errors
from (

    select
        customer_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_customer`
    where customer_sk is not null
    group by customer_sk
    having count(*) > 1

) validation_errors


