with selected as (
    select
    countryregioncode as countryregion_id
    , name as pais
    from {{ ref('stg_countryregion' )}}
)

select * from selected