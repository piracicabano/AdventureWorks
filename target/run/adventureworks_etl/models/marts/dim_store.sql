

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_store`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    businessentityid as store_id
    , name
    , salespersonid
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_store`
)
, transformed as (
    select
    row_number() over (order by store_id) as store_sk
    , *
from selected
)

select * from transformed
  );
    