

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesorderheadersalesreason`
  OPTIONS()
  as with dados_fonte as (
    select
    salesorderid
    , salesreasonid
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesorderheadersalesreason`
)

select * from dados_fonte;

