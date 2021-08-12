with dados_fonte as (
    select
    businessentityid
    , creditcardid
    from {{ source('adventureworks_etl', 'personcreditcard' )}}
)

select * from dados_fonte