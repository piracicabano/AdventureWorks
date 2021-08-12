with dados_fonte as (
    select
    businessentityid
    , nationalidnumber
    , loginid
    , jobtitle
    , birthdate
    , maritalstatus
    , gender
    , hiredate
    , salariedflag
    , vacationhours
    , sickleavehours
    , currentflag
    , organizationnode
    from {{ source('adventureworks_etl', 'employee' )}}
)

select * from dados_fonte