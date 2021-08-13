with selected as (
    select
    businessentityid as person_id
    , creditcardid as creditcard_id
    from {{ ref('stg_personcreditcard' )}}
)
, transformed as (
    select
    row_number() over (order by person_id) as person_sk
    , row_number() over (order by person_id) as creditcard_sk
    , *
from selected
)

select * from transformed