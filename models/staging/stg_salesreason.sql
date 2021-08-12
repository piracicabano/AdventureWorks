with dados_fonte as (
    select
    salesreasonid 
    , name  
    , reasontype
    from {{ source('adventureworks_etl', 'salesreason' )}}
)

select * from dados_fonte