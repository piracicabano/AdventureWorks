

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesreason`
  OPTIONS()
  as with dados_fonte as (
    select
    salesreasonid 
    , name  
    , reasontype
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesreason`
)

select * from dados_fonte;

