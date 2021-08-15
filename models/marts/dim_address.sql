with selected as (
    select
    addressid as address_id
    , addressline1
    , addressline2
    , city
    , stateprovinceid
    , postalcode
    , spatiallocation
    from {{ ref('stg_address' )}}
)

select * from selected