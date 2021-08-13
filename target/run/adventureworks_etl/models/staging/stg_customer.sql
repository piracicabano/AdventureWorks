

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_customer`
  OPTIONS()
  as with dados_fonte as (
    select
    customerid
    , personid
    , storeid
    , territoryid
    from `cursoanalytics-318700`.`adventureworks_etl`.`customer`
)

select * from dados_fonte;

