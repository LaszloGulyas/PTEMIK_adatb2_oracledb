drop table CUSTOMER cascade constraints;
drop table CUSTOMER_ADDRESS cascade constraints;
drop table ORDER_DETAILS cascade constraints;
drop table PRODUCT_CATEGORY cascade constraints;
drop table PRODUCT_INVENTORY cascade constraints;
drop table PRODUCT cascade constraints;
drop table ORDER_ITEM cascade constraints;
drop table SHOPPING_SESSION cascade constraints;
drop table SHOPPING_CART_ITEM cascade constraints;

drop procedure UPDATE_TOTAL_ORDER_VALUE;
drop procedure UPDATE_TOTAL_CART_VALUE;

drop view ORDER_VALUE_PARAMS;
drop view SHOPPING_CART_VALUE_PARAMS;

drop user win2 cascade;
