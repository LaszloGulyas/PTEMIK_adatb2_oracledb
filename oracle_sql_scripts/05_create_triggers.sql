create or replace trigger OI_QUANTITY_CHANGES
  after insert or update or delete of quantity
  on order_item
begin
  UPDATE_TOTAL_ORDER_VALUE();
end OI_QUANTITY_CHANGES;
/

create or replace trigger PRODUCT_PRICE_CHANGES
  after insert or update or delete of price
  on product
begin
  UPDATE_TOTAL_CART_VALUE();
  UPDATE_TOTAL_ORDER_VALUE();
end PRODUCT_PRICE_CHANGES;
/

create or replace trigger SCI_QUANTITY_CHANGES
  after insert or update or delete of quantity
  on shopping_cart_item
begin
  UPDATE_TOTAL_CART_VALUE();
end SCI_QUANTITY_CHANGES;
/
