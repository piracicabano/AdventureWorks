

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesterritory`
  OPTIONS()
  as with dados_fonte as (
    select
    territoryid
    , name
    , countryregioncode
    , salesytd
    , saleslastyear
    , costytd
    , costlastyear
    from `cursoanalytics-318700`.`adventureworks_etl`.`salesterritory`
)

select * from dados_fonte;

