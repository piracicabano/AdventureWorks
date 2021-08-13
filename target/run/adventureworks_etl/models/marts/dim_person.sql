

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_person`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    businessentityid as person_id
    , namestyle
    , title
    , firstname
    , middlename
    , lastname
    , suffix
    , emailpromotion
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_person`
)
, transformed as (
    select
    row_number() over (order by person_id) as person_sk
    , *
from selected
)

select * from transformed
  );
    