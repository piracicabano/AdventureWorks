
    
    



select count(*) as validation_errors
from (

    select
        person_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_person`
    where person_sk is not null
    group by person_sk
    having count(*) > 1

) validation_errors


