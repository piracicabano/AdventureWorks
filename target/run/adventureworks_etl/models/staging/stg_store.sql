

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_store`
  OPTIONS()
  as with dados_fonte as (
    select
    businessentityid
    , name
    , salespersonid
    from `cursoanalytics-318700`.`adventureworks_etl`.`store`
)

select * from dados_fonte;

