

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_product`
  
  
  OPTIONS()
  as (
    with selected as (
    select
    productid as product_id
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
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_product`
)
, transformed as (
    select
    row_number() over (order by product_id) as product_sk
    , *
from selected
)

select * from transformed
  );
    