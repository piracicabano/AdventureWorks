with selected as (
    select
    businessentityid as businessentity_id
    , addressid as address_id
    , addresstypeid as addresstype_id
    from {{ ref('stg_businessentityaddress' )}}
)
, transformed as (
    select
    row_number() over (order by businessentity_id) as businessentity_sk
    , row_number() over (order by address_id) as address_sk
    , row_number() over (order by addresstype_id) as addresstype_sk
    , *
from selected
)

select * from transformed