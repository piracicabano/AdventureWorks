
with dbt__CTE__INTERNAL_test as (
with
    validation as (
        select count(salesorderid) as qtde_pedidos
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`fact_salesorderdetail`
        where orderdate <= '2014-06-30'
    )

select * from validation where qtde_pedidos != 121317
)select count(*) from dbt__CTE__INTERNAL_test