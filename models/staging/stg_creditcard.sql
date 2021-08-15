with dados_fonte as (
    select
    creditcardid
    , cardtype
    , cardnumber
    , expmonth
    , expyear
    from {{ source('adventureworks_etl', 'creditcard')}}
)

select * from dados_fonte