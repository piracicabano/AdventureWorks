with
    validation as (
        select count(product_sk) as qtde_produtos
        from {{ref('dim_product')}}
    )

select * from validation where qtde_produtos != 504