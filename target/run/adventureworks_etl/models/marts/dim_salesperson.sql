

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesperson`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    businessentityid as salesperson_id
    , territoryid
    , salesquota
    , bonus
    , commissionpct
    , salesytd
    , saleslastyear
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesperson`
)
, transformed as (
    select
    row_number() over (order by salesperson_id) as salesperson_sk
    , *
from selected
)

select * from transformed
  );
    