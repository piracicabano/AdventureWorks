with dados_fonte as (
    select
    salesorderid
    , salesreasonid
    from {{ source('adventureworks_etl', 'salesorderheadersalesreason' )}}
)

select * from dados_fonte