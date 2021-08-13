

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_employee`
  
  
  OPTIONS()
  as (
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
    from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_employee`
)
, transformed as (
    select
    row_number() over (order by employee_id) as employee_sk
    , *
from selected
)

select * from transformed
  );
    