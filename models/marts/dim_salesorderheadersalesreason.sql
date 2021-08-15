with selected as (
    select
    salesorderid as salesorder_id
    , salesreasonid as salesreason_id
    from {{ ref('stg_salesorderheadersalesreason' )}}
)
, transformed as (
    select
    row_number() over (order by salesorder_id) as salesorder_sk
    , row_number() over (order by salesreason_id) as salesreason_sk
    , *
from selected
)

select * from transformed