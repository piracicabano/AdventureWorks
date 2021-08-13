

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_customer`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    customerid as customer_id
    , personid
    , storeid
    , territoryid
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_customer`
)
, transformed as (
    select
    row_number() over (order by customer_id) as customer_sk
    , *
from selected
)

select * from transformed
  );
    