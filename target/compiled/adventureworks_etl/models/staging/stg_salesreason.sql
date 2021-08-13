with dados_fonte as (
    select
    salesreasonid 
    , name  
    , reasontype
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesreason`
)

select * from dados_fonte