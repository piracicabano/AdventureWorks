
    
    



select count(*) as validation_errors
from (

    select
        employee_sk

    from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_employee`
    where employee_sk is not null
    group by employee_sk
    having count(*) > 1

) validation_errors


