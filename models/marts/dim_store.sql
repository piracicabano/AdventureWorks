with selected as (
    select
    businessentityid as store_id
    , name
    , salespersonid
    from {{ ref('stg_store' )}}
)
, transformed as (
    select
    row_number() over (order by store_id) as store_sk
    , *
from selected
)

select * from transformed