

  create or replace view `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_personcreditcard`
  OPTIONS()
  as with dados_fonte as (
    select
    businessentityid
    , creditcardid
    from `cursoanalytics-318700`.`adventureworks_etl`.`personcreditcard`
)

select * from dados_fonte;

