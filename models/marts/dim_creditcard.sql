with selected as (
    select
    creditcardid as creditcard_id
    , cardtype
    , cardnumber
    , expmonth
    , expyear
    from {{ ref('stg_creditcard' )}}
)
, transformed as (
    select
    row_number() over (order by creditcard_id) as creditcard_sk
    , *
from selected
)

select * from transformed