
    
    



select count(*) as validation_errors
from (

    select
        territory_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesterritory`
    where territory_sk is not null
    group by territory_sk
    having count(*) > 1

) validation_errors


