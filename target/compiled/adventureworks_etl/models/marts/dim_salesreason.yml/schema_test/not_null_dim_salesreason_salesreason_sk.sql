
    
    



select count(*) as validation_errors
from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesreason`
where salesreason_sk is null


