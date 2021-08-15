with selected as (
    select
    stateprovinceid as stateprovince_id
    , stateprovincecode
    , countryregioncode
    , name
    , territoryid
    from {{ ref('stg_stateprovince' )}}
)
, transformed as (
    select
    row_number() over (order by stateprovince_id) as stateprovince_sk
    , *
from selected
)

select * from transformed