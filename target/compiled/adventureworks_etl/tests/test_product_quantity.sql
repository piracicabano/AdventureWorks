
with dbt__CTE__INTERNAL_test as (
with
    validation as (
        select count(product_sk) as qtde_produtos
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_product`
    )

select * from validation where qtde_produtos != 504
)select count(*) from dbt__CTE__INTERNAL_test