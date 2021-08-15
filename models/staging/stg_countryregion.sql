with dados_fonte as (
    select
    countryregioncode
    , name
    from {{ source('adventureworks_etl', 'countryregion')}}
)

select * from dados_fonte