with dados_fonte as (
    select
    addressid
    , addressline1
    , addressline2
    , city
    , stateprovinceid
    , postalcode
    , spatiallocation
    from {{ source('adventureworks_etl', 'address' )}}
)

select * from dados_fonte