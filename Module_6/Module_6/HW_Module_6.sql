use VP_module_6
go
---TASK 1---
select productid,name, city,
 ROW_NUMBER () over (order by city) as order_number
from products;

---TASK 2---
select productid,name, city,
 ROW_NUMBER () over (partition by city order by name) as order_number
from products;

---TASK 3---
select * 
from
(select productid,name, city,
 ROW_NUMBER () over (partition by city order by name) as order_number
from products) as cities
where order_number=1;

---TASK 4---
select productid,detailid,quantity, 
sum(quantity) over (partition by productid) as all_quantity_per_prod,
sum(quantity) over (partition by detailid) as all_quantity_per_det
from supplies;

---TASK 5---
select * from
(select supplierid,detailid,productid,quantity,
ROW_NUMBER() over (order by supplierid) as rn,
count(*) over () as tot
from supplies) as f
where rn between 10 and 15;

---TASK 6---
select * from
(select supplierid,detailid,productid,quantity,
AVG(quantity) over() as avg_qty
from supplies) as av
where quantity<avg_qty;
