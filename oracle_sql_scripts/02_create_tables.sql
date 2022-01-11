create table CUSTOMER
(
  id         NUMBER generated always as identity,
  username   VARCHAR2(50),
  password   VARCHAR2(50),
  first_name VARCHAR2(50),
  last_name  VARCHAR2(50),
  mobile     VARCHAR2(50)
)
;
alter table CUSTOMER
  add constraint CUSTOMER_PK primary key (ID);

create table CUSTOMER_ADDRESS
(
  id           NUMBER generated always as identity,
  customer_id  NUMBER,
  address_line VARCHAR2(50),
  city         VARCHAR2(50),
  postal_code  VARCHAR2(8),
  country      VARCHAR2(50)
)
;
alter table CUSTOMER_ADDRESS
  add constraint CUSTOMER_ADDRESS_PK primary key (ID);
alter table CUSTOMER_ADDRESS
  add constraint CA_CUSTOMER_FK foreign key (CUSTOMER_ID)
  references CUSTOMER (ID);

create table ORDER_DETAILS
(
  id          NUMBER generated always as identity,
  customer_id NUMBER,
  total_value NUMBER
)
;
alter table ORDER_DETAILS
  add constraint ORDER_DETAILS_PK primary key (ID);
alter table ORDER_DETAILS
  add constraint OD_CUSTOMER_FK foreign key (CUSTOMER_ID)
  references CUSTOMER (ID);

create table PRODUCT_CATEGORY
(
  id          NUMBER generated always as identity,
  name        VARCHAR2(50),
  description VARCHAR2(100)
)
;
alter table PRODUCT_CATEGORY
  add constraint PRODUCT_CATEGORY_PK primary key (ID);

create table PRODUCT_INVENTORY
(
  id       NUMBER generated always as identity,
  quantity NUMBER
)
;
alter table PRODUCT_INVENTORY
  add constraint PRODUCT_INVENTORY_PK primary key (ID);

create table PRODUCT
(
  id           NUMBER generated always as identity,
  name         VARCHAR2(50),
  description  VARCHAR2(100),
  sku          VARCHAR2(50),
  price        NUMBER,
  category_id  NUMBER,
  inventory_id NUMBER
)
;
create unique index P_PRODUCT_INVENTORY_FK on PRODUCT (INVENTORY_ID);
alter table PRODUCT
  add constraint PRODUCT_PK primary key (ID);
alter table PRODUCT
  add constraint P_PRODUCT_CATEGORY_FK foreign key (CATEGORY_ID)
  references PRODUCT_CATEGORY (ID);
alter table PRODUCT
  add constraint P_PRODUCT_INVENTORY_FK foreign key (INVENTORY_ID)
  references PRODUCT_INVENTORY (ID) on delete cascade;

create table ORDER_ITEM
(
  id               NUMBER generated always as identity,
  order_details_id NUMBER,
  product_id       NUMBER,
  quantity         NUMBER
)
;
create unique index OI_PRODUCT_FK_AND_OI_ORDER_DETAILS_FK on ORDER_ITEM (ORDER_DETAILS_ID, PRODUCT_ID);
alter table ORDER_ITEM
  add constraint ORDER_ITEM_PK primary key (ID);
alter table ORDER_ITEM
  add constraint OI_ORDER_DETAILS_FK foreign key (ORDER_DETAILS_ID)
  references ORDER_DETAILS (ID);
alter table ORDER_ITEM
  add constraint OI_PRODUCT_FK foreign key (PRODUCT_ID)
  references PRODUCT (ID);

create table SHOPPING_SESSION
(
  id          NUMBER generated always as identity,
  customer_id NUMBER,
  total_value NUMBER
)
;
create unique index SS_CUSTOMER_FK on SHOPPING_SESSION (CUSTOMER_ID);
alter table SHOPPING_SESSION
  add constraint SHOPPING_SESSION_PK primary key (ID);
alter table SHOPPING_SESSION
  add constraint SS_CUSTOMER_FK foreign key (CUSTOMER_ID)
  references CUSTOMER (ID);

create table SHOPPING_CART_ITEM
(
  id         NUMBER generated always as identity,
  session_id NUMBER,
  product_id NUMBER,
  quantity   NUMBER
)
;
create unique index SCI_SHOPPING_SESSION_FK_AND_SCI_PRODUCT_FK on SHOPPING_CART_ITEM (SESSION_ID, PRODUCT_ID);
alter table SHOPPING_CART_ITEM
  add constraint SHOPPING_CART_ITEM_PK primary key (ID);
alter table SHOPPING_CART_ITEM
  add constraint SCI_PRODUCT_FK foreign key (PRODUCT_ID)
  references PRODUCT (ID);
alter table SHOPPING_CART_ITEM
  add constraint SCI_SHOPPING_SESSION_FK foreign key (SESSION_ID)
  references SHOPPING_SESSION (ID);
