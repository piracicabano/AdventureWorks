with
    validation as (
        select count(salesorderid) as qtde_pedidos
        from {{ref('fact_salesorderdetail')}}
        where orderdate <= '2014-06-30'
    )

select * from validation where qtde_pedidos != 121317

