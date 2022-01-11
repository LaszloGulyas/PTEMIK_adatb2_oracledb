--Legtobb osszegben rendelest leado customerek csokkeno sorrendben
select c.first_name, c.last_name, sum(od.total_value) as total_spent
from customer c
inner join order_details od
on c.id = od.customer_id
group by (c.first_name, c.last_name)
order by total_spent desc;

--Budapestrol leadott rendelesek ertekenek osszege
select cust.city, sum(od.total_value) as total_spent
from (select ca.city, c.id
      from customer_address ca
      inner join customer c
      on ca.customer_id = c.id
      where ca.city = 'Budapest') cust
inner join order_details od
on od.customer_id = cust.id
group by cust.city;

--Egyes termékkategórák hány leadott rendelésben szerepeltek
select pc.name, count(t.category_id) as count_of_orders
from (select *
      from order_item oi
      inner join product p
      on p.id = oi.product_id) t
inner join product_category pc
on t.category_id = pc.id
group by pc.name
order by count_of_orders desc;
