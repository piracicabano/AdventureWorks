with selected as (
    select
    businessentityid as person_id
    , namestyle
    , title
    , firstname
    , middlename
    , lastname
    , suffix
    , emailpromotion
    from {{ ref('stg_person' )}}
)
, transformed as (
    select
    row_number() over (order by person_id) as person_sk
    , *
from selected
)

select * from transformed