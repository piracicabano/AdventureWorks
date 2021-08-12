with dados_fonte as (
    select
    territoryid
    , name
    , countryregioncode
    , salesytd
    , saleslastyear
    , costytd
    , costlastyear
    from {{ source('adventureworks_etl', 'salesterritory' )}}
)

select * from dados_fonte