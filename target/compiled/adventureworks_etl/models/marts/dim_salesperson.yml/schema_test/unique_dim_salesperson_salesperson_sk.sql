
    
    



select count(*) as validation_errors
from (

    select
        salesperson_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesperson`
    where salesperson_sk is not null
    group by salesperson_sk
    having count(*) > 1

) validation_errors


