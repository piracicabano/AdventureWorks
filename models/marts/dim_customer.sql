with selected as (
    select
    customerid as customer_id
    , personid
    , storeid
    , territoryid
    from {{ ref('stg_customer' )}}
)
, transformed as (
    select
    row_number() over (order by customer_id) as customer_sk
    , *
from selected
)

select * from transformed