with dados_fonte as (
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
    from {{ source('adventureworks_etl', 'product' )}}
)

select * from dados_fonte