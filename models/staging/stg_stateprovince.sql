with dados_fonte as (
    select
    stateprovinceid
    , stateprovincecode
    , countryregioncode
    , name
    , territoryid
    from {{ source('adventureworks_etl', 'stateprovince' )}}
)

select * from dados_fonte