with dados_fonte as (
    select
    customerid
    , personid
    , storeid
    , territoryid
    from `cursoanalytics-318700`.`adventureworks_etl`.`customer`
)

select * from dados_fonte