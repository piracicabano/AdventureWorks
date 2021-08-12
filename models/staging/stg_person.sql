with dados_fonte as (
    select
    businessentityid
    , namestyle
    , title
    , firstname
    , middlename
    , lastname
    , suffix
    , emailpromotion
    from {{ source('adventureworks_etl', 'person' )}}
)

select * from dados_fonte