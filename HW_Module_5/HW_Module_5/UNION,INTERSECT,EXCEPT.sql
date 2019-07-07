use VP_module_5
go
---TASK 1---
select supplierid
from suppliers
where city= 'London'
UNION
select supplierid
from suppliers
where city= 'Paris';

---TASK 2 a (AND) without duplicats---  

select city from suppliers
INTERSECT 
select city from details
order by city asc

---TASK 2 b (OR)with duplicates ---

select city from suppliers
UNION
select city from details
order by city asc

---TASK 2 b (OR)without duplicates ---

select city from suppliers
UNION ALL
select city from details
order by city asc

---TASK 3 ---

select supplierid,name from suppliers
except
select supplierid,name from suppliers
where city='London';

---TASK 4 ---

select productid from products
where city='London' or city='Paris'
except
select productid from products
where city='Paris' or city='Rome';

---TASK 5 ---
select supplierid,detailid,productid
from supplies
where supplierid in(select supplierid from suppliers where city='London')
UNION
select supplierid,detailid,productid
from supplies
where detailid in(select detailid from details where color='Green')
EXCEPT
select supplierid,detailid,productid
from supplies
where productid in(select productid from products where city='Paris')

