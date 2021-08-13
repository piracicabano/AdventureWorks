

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_product`
  OPTIONS()
  as with dados_fonte as (
    select
    productid
    , name
    , productnumber
    , makeflag
    , finishedgoodsflag
    , color
    , safetystocklevel
    , reorderpoint
    , standardcost
    , listprice
    , size
    , sizeunitmeasurecode
    , weightunitmeasurecode
    , weight
    , daystomanufacture
    , productline
    , class
    , style
    , productsubcategoryid
    , productmodelid
    , sellstartdate
    , sellenddate
    from `cursoanalytics-318700`.`adventureworks_etl`.`product`
)

select * from dados_fonte;

