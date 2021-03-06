with dados_fonte as (
    select
    salesorderid
    , revisionnumber
    , orderdate
    , duedate
    , shipdate
    , status
    , onlineorderflag
    , purchaseordernumber
    , accountnumber
    , customerid
    , salespersonid
    , territoryid
    , billtoaddressid
    , shiptoaddressid
    , shipmethodid
    , creditcardid
    , creditcardapprovalcode
    , currencyrateid
    , subtotal
    , taxamt
    , freight
    , totaldue
    from {{ source('adventureworks_etl', 'salesorderheader' )}}
)

select * from dados_fonte