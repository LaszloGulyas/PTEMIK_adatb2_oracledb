create or replace view order_value_params as
select oi.order_details_id, sum (oi.quantity * p.price) as total_value
    from ORDER_ITEM oi, PRODUCT p
    where oi.product_id = p.id
    group by oi.order_details_id;


create or replace view shopping_cart_value_params as
select sci.session_id, sum (sci.quantity * p.price) as total_value
    from SHOPPING_CART_ITEM sci, PRODUCT p
    where sci.product_id = p.id
    group by sci.session_id;
