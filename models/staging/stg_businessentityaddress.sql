with dados_fonte as (
    select
    businessentityid
    , addressid
    , addresstypeid
    from {{ source('adventureworks_etl', 'businessentityaddress' )}}
)

select * from dados_fonte