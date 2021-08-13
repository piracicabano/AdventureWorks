

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`fact_salesorderdetail`
  
  
  OPTIONS()
  as (
    with 
    customer as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_customer`
    ),
    employee as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_employee`
    ),    
    person as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_person`
    ),
    personcreditcard as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_personcreditcard`
    ),
    product as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_product`
    ),
    salesperson as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesperson`
    ),        
    salesreason as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesreason`
    ),
    salesterritory as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesterritory`
    ),
    store as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_store`
    ),
    orderheader_with_sk as(
        select
            orderheader.salesorderid
            , customer_sk as customer_fk
            , salesperson_sk as salesperson_fk
            , territory_sk as territory_fk
            , creditcard_sk as creditcard_fk
            , orderheader.billtoaddressid
            , orderheader.shiptoaddressid
            , orderheader.shipmethodid
            , orderheader.currencyrateid
            , orderheader.revisionnumber
            , orderheader.orderdate
            , orderheader.duedate
            , orderheader.shipdate
            , orderheader.status
            , orderheader.onlineorderflag
            , orderheader.purchaseordernumber
            , orderheader.accountnumber
            , orderheader.creditcardapprovalcode
            , orderheader.subtotal
            , orderheader.taxamt
            , orderheader.freight
            , orderheader.totaldue
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesorderheader` as orderheader
        left join customer on orderheader.customerid = customer.customer_id
        left join salesperson on orderheader.salespersonid = salesperson.salesperson_id
        left join salesterritory on orderheader.territoryid = salesterritory.territory_id
        left join personcreditcard on orderheader.creditcardid = personcreditcard.creditcard_id
    )
    , orderdetail_with_sk as(
        select
            orderdetail.salesorderid
            , orderdetail.salesorderdetailid
            , orderdetail.carriertrackingnumber
            , orderdetail.orderqty
            , product.product_sk as product_fk
            , orderdetail.specialofferid
            , orderdetail.unitprice
            , orderdetail.unitpricediscount      
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesorderdetail` as orderdetail
        left join product on orderdetail.productid = product.product_id
    )
    , final as (
        select
            orderdetail_with_sk.salesorderdetailid
            , orderdetail_with_sk.salesorderid
            , orderheader_with_sk.customer_fk
            , orderdetail_with_sk.product_fk
            , orderheader_with_sk.salesperson_fk
            , orderheader_with_sk.territory_fk
            , orderheader_with_sk.creditcard_fk
            , orderheader_with_sk.billtoaddressid
            , orderheader_with_sk.shiptoaddressid
            , orderheader_with_sk.shipmethodid
            , orderheader_with_sk.currencyrateid
            , orderheader_with_sk.revisionnumber
            , orderheader_with_sk.orderdate
            , orderheader_with_sk.duedate
            , orderheader_with_sk.shipdate
            , orderheader_with_sk.status
            , orderheader_with_sk.onlineorderflag
            , orderheader_with_sk.purchaseordernumber
            , orderheader_with_sk.accountnumber
            , orderheader_with_sk.creditcardapprovalcode
            , orderheader_with_sk.subtotal
            , orderheader_with_sk.taxamt
            , orderheader_with_sk.freight
            , orderheader_with_sk.totaldue
            , orderdetail_with_sk.carriertrackingnumber
            , orderdetail_with_sk.orderqty
            , orderdetail_with_sk.specialofferid
            , orderdetail_with_sk.unitprice
            , orderdetail_with_sk.unitpricediscount 
            from orderheader_with_sk
            left join orderdetail_with_sk on orderheader_with_sk.salesorderid = orderdetail_with_sk.salesorderid
    )
    select * from final
  );
    