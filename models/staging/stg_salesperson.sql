with dados_fonte as (
    select
    businessentityid
    , territoryid
    , salesquota
    , bonus
    , commissionpct
    , salesytd
    , saleslastyear
    from {{ source('adventureworks_etl', 'salesperson' )}}
)

select * from dados_fonte