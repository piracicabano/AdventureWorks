

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesorderdetail`
  OPTIONS()
  as with dados_fonte as (
    select
    salesorderid
    , salesorderdetailid
    , carriertrackingnumber
    , orderqty
    , productid
    , specialofferid
    , unitprice
    , unitpricediscount
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesorderdetail`
)

select * from dados_fonte;

