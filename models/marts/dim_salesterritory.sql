with selected as (
    select
    territoryid as territory_id
    , name
    , countryregioncode
    , salesytd
    , saleslastyear
    , costytd
    , costlastyear
    from {{ ref('stg_salesterritory' )}}
)
, transformed as (
    select
    row_number() over (order by territory_id) as territory_sk
    , *
from selected
)

select * from transformed