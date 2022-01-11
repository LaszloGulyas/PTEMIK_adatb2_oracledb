insert into CUSTOMER (username, password, first_name, last_name, mobile)
values ('kispista01', 'j28fj28dj28', 'Istvan', 'Kis', '+36209275847');
insert into CUSTOMER (username, password, first_name, last_name, mobile)
values ('nagyjozsi23', 's82kfd82h4s8', 'Jozsef', 'Nagy', '+36704372954');
insert into CUSTOMER (username, password, first_name, last_name, mobile)
values ('horvathi', 'pq83mc74kr9', 'Ildiko', 'Horvath', '+36307229571');
commit;

insert into CUSTOMER_ADDRESS (customer_id, address_line, city, postal_code, country)
values (2, 'Vaci ut 3.', 'Budapest', '1131', 'Magyarország');
insert into CUSTOMER_ADDRESS (customer_id, address_line, city, postal_code, country)
values (1, 'Petofi Sandor u 12.', 'Budapest', '1041', 'Magyarország');
insert into CUSTOMER_ADDRESS (customer_id, address_line, city, postal_code, country)
values (1, 'Pécsi út 42.', 'Pécs', '7624', 'Magyarország');
insert into CUSTOMER_ADDRESS (customer_id, address_line, city, postal_code, country)
values (3, 'Kossuth tér 41.', 'Vác', '2600', 'Magyarország');
commit;

insert into ORDER_DETAILS (customer_id)
values (2);
insert into ORDER_DETAILS (customer_id)
values (3);
commit;

insert into PRODUCT_CATEGORY (name, description)
values ('Karácsonyi díszek', 'egész éves választék');
insert into PRODUCT_CATEGORY (name, description)
values ('Édességek', 'csomagolt és darabáru is');
insert into PRODUCT_CATEGORY (name, description)
values ('Világítás', null);
commit;

insert into PRODUCT_INVENTORY (quantity)
values (35);
insert into PRODUCT_INVENTORY (quantity)
values (20);
insert into PRODUCT_INVENTORY (quantity)
values (150);
insert into PRODUCT_INVENTORY (quantity)
values (27);
insert into PRODUCT_INVENTORY (quantity)
values (11);
commit;

insert into PRODUCT (name, description, sku, price, category_id, inventory_id)
values ('Karácsonyfa csúcs dísz', 'arany színű', 'aaaa0928', 990, 1, 1);
insert into PRODUCT (name, description, sku, price, category_id, inventory_id)
values ('Karácsonyfa gömb díszek', 'műanyag', 'aaaa7298', 3990, 1, 2);
insert into PRODUCT (name, description, sku, price, category_id, inventory_id)
values ('Szaloncukor', 'vegyes íz', 'bbbb2394', 2490, 2, 3);
insert into PRODUCT (name, description, sku, price, category_id, inventory_id)
values ('Bejgli csomagolt', 'diós és mákos vegyesen', 'bbbb1645', 1990, 2, 4);
insert into PRODUCT (name, description, sku, price, category_id, inventory_id)
values ('Karácsonyfa izzó készlet', '230V', 'cccc0074', 6790, 3, 5);
commit;

insert into ORDER_ITEM (order_details_id, product_id, quantity)
values (1, 1, 1);
insert into ORDER_ITEM (order_details_id, product_id, quantity)
values (1, 2, 3);
insert into ORDER_ITEM (order_details_id, product_id, quantity)
values (2, 3, 4);
commit;

insert into SHOPPING_SESSION (customer_id)
values (1);
insert into SHOPPING_SESSION (customer_id)
values (2);
commit;

insert into SHOPPING_CART_ITEM (session_id, product_id, quantity)
values (1, 4, 2);
insert into SHOPPING_CART_ITEM (session_id, product_id, quantity)
values (1, 5, 1);
commit;
