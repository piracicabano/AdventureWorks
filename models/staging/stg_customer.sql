with dados_fonte as (
    select
    customerid
    , personid
    , storeid
    , territoryid
    from {{ source('adventureworks_etl', 'customer' )}}
)

select * from dados_fonte