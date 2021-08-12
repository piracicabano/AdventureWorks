with dados_fonte as (
    select
    businessentityid
    , name
    , salespersonid
    from {{ source('adventureworks_etl', 'store' )}}
)

select * from dados_fonte