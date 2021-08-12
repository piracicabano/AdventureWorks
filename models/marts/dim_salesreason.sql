with selected as (
    select
    salesreasonid as salesreason_id
    , name  
    , reasontype
    from {{ ref('stg_salesreason' )}}
)
, transformed as (
    select
    row_number() over (order by salesreason_id) as salesreason_sk
    , *
from selected
)

select * from transformed