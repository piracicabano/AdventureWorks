
    
    



select count(*) as validation_errors
from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_personcreditcard`
where creditcard_sk is null


