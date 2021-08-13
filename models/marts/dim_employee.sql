with selected as (
    select
    businessentityid as employee_id
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
    from {{ ref('stg_employee' )}}
)
, transformed as (
    select
    row_number() over (order by employee_id) as employee_sk
    , *
from selected
)

select * from transformed