

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_personcreditcard`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    businessentityid as person_id
    , creditcardid as creditcard_id
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_personcreditcard`
)
, transformed as (
    select
    row_number() over (order by person_id) as person_sk
    , row_number() over (order by person_id) as creditcard_sk
    , *
from selected
)

select * from transformed
  );
    