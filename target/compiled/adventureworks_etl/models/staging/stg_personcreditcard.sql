with dados_fonte as (
    select
    businessentityid
    , creditcardid
    from `cursoanalytics-318700`.`adventureworks_etl`.`personcreditcard`
)

select * from dados_fonte