
    
    



select count(*) as validation_errors
from (

    select
        store_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_store`
    where store_sk is not null
    group by store_sk
    having count(*) > 1

) validation_errors


