
    
    



select count(*) as validation_errors
from (

    select
        salesreason_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesreason`
    where salesreason_sk is not null
    group by salesreason_sk
    having count(*) > 1

) validation_errors


