

  create or replace table `cursoanalytics-318700`.`dbt_jrgseverino`.`fact_salesorderdetail`
  
  
  OPTIONS()
  as (
    with 
    customer as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_customer`
    ),
    creditcard as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_creditcard`
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
    salesorderheadersalesreason as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesorderheadersalesreason`
    ),    
    salesterritory as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_salesterritory`
    ),
    countryregion as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_countryregion`
    ),    
    stateprovince as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_stateprovince`
    ),    
    address as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_address`        
    ),     
    store as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_store`
    ),
    dates as (
        select *
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`dim_date`
    ),    
    orderheader_with_sk as(
        select
            orderheader.salesorderid
            , customer_sk as customer_fk
            , salesperson_sk as salesperson_fk
            , creditcard.creditcard_sk as creditcard_fk
            , territory_sk as territory_fk
            , countryregion.countryregion_id as countryregion_fk
            , countryregion.pais
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
            , person.firstname 
            , person.lastname
            , creditcard.cardtype               
            , salesreason.name as motivo_venda  
            , salesreason.reasontype            
            , stateprovince.name as estado      
            , address.city as cidade            
        from `cursoanalytics-318700`.`dbt_jrgseverino`.`stg_salesorderheader` as orderheader
        left join customer on orderheader.customerid = customer.customer_id
        left join person on customer.customer_id = person.person_id 
        left join salesperson on orderheader.salespersonid = salesperson.salesperson_id
        left join salesterritory on orderheader.territoryid = salesterritory.territory_id
        left join stateprovince on salesterritory.territory_id = stateprovince.stateprovince_id
        left join address on stateprovince.stateprovince_id = address.address_id
        left join countryregion on salesterritory.countryregioncode = countryregion.countryregion_id
        left join personcreditcard on orderheader.creditcardid = personcreditcard.creditcard_id
        left join creditcard on orderheader.creditcardid = creditcard.creditcard_id
        left join salesorderheadersalesreason on orderheader.salesorderid = salesorderheadersalesreason.salesorder_id
        left join salesreason on salesorderheadersalesreason.salesreason_id = salesreason.salesreason_id
    )
    , orderdetail_with_sk as(
        select
            orderdetail.salesorderid
            , orderdetail.salesorderdetailid
            , orderdetail.carriertrackingnumber
            , orderdetail.orderqty
            , product.product_sk as product_fk
            , product.name as product
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
            , orderdetail_with_sk.product as produto
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
            , concat(orderheader_with_sk.firstname," ",orderheader_with_sk.lastname) as cliente
            , orderheader_with_sk.cardtype
            , orderheader_with_sk.motivo_venda
            , orderheader_with_sk.reasontype
            , orderheader_with_sk.countryregion_fk
            , orderheader_with_sk.pais
            , orderheader_with_sk.estado
            , orderheader_with_sk.cidade
            from orderheader_with_sk
            left join orderdetail_with_sk on orderheader_with_sk.salesorderid = orderdetail_with_sk.salesorderid
    )
    select * from final
  );
    