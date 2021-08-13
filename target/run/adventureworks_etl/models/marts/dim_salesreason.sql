

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesreason`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    salesreasonid as salesreason_id
    , name  
    , reasontype
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesreason`
)
, transformed as (
    select
    row_number() over (order by salesreason_id) as salesreason_sk
    , *
from selected
)

select * from transformed
  );
    