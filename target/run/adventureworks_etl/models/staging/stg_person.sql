

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_person`
  OPTIONS()
  as with dados_fonte as (
    select
    businessentityid
    , namestyle
    , title
    , firstname
    , middlename
    , lastname
    , suffix
    , emailpromotion
    from `cursoanalytics-318700`.`adventureworks_etl`.`person`
)

select * from dados_fonte;

