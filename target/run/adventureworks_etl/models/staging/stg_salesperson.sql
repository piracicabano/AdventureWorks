

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesperson`
  OPTIONS()
  as with dados_fonte as (
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

select * from dados_fonte;

