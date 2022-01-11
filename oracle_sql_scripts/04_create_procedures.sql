create or replace procedure UPDATE_TOTAL_CART_VALUE is
calculated_total_value number;
begin
  update SHOPPING_SESSION ss set ss.total_value = 0;

  update (select ss.total_value oldvalue, scvp.total_value calculated
          from SHOPPING_SESSION ss, SHOPPING_CART_VALUE_PARAMS scvp
          where ss.id = scvp.session_id)
    set oldvalue = calculated;
end UPDATE_TOTAL_CART_VALUE;
/

create or replace procedure UPDATE_TOTAL_ORDER_VALUE is
calculated_total_value number;
begin
  update ORDER_DETAILS od set od.total_value = 0;

  update (select oi.total_value oldvalue, ovp.total_value calculated
          from ORDER_DETAILS oi, ORDER_VALUE_PARAMS ovp
          where oi.id = ovp.order_details_id)
    set oldvalue = calculated;
end UPDATE_TOTAL_ORDER_VALUE;
/
