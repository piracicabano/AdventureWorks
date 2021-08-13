with dados_fonte as (
    select
    businessentityid
    , territoryid
    , salesquota
    , bonus
    , commissionpct
    , salesytd
    , saleslastyear
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesperson`
)

select * from dados_fonte