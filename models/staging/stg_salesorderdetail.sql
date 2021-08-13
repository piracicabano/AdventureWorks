with dados_fonte as (
    select
    salesorderid
    , salesorderdetailid
    , carriertrackingnumber
    , orderqty
    , productid
    , specialofferid
    , unitprice
    , unitpricediscount
    from {{ source('adventureworks_etl', 'salesorderdetail' )}}
)

select * from dados_fonte