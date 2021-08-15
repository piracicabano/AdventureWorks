with dados_fonte as (
    select
    *
    from {{ ref('stg_dates')}}
)

select * from dados_fonte