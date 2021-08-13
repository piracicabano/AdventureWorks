
    
    



select count(*) as validation_errors
from (

    select
        creditcard_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_personcreditcard`
    where creditcard_sk is not null
    group by creditcard_sk
    having count(*) > 1

) validation_errors


