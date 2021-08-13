with selected as (
    select
    territoryid as territory_id
    , name
    , countryregioncode
    , salesytd
    , saleslastyear
    , costytd
    , costlastyear
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesterritory`
)
, transformed as (
    select
    row_number() over (order by territory_id) as territory_sk
    , *
from selected
)

select * from transformed