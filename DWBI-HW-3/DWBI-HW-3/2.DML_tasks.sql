use VP_module_3
go

 ---TASK 1----

 ;with cte as(
 select rating
 from suppliers
 where supplierid=4)
 update suppliers
 set rating=rating+10
 where rating<(select * from cte)
 go

 ---TASK 2---

 select distinct products.productid 
 into London_products
 from products
 inner join supplies on supplies.productid = products.productid
 inner join details on supplies.detailid = details.detailid
 where products.city = 'London' OR details.city = 'London';
 
---TASK 3-----

---keep the products where at least at one row of the supplies table there is detailid value, and delete the products where NONE of the rows of the supplies table has detailid value
delete from supplies
 where productid NOT IN
(select productid from supplies 
group by productid,detailid having not detailid is null)
---trigger to delete products from products table when this product is deleted from supplies table
go
CREATE or alter TRIGGER Produts_DELETE 
ON supplies
AFTER DELETE
AS
BEGIN
delete from products 
WHERE productid=(select productid from DELETED)
END

---TASK 4---

select distinct s1.supplierid, s1.detailid as detail1, s2.detailid as detail2
into couples_of_details
from supplies s1
 inner join supplies as s2
 on  s1.supplierid=s2.supplierid 
where s1.detailid<>s2.detailid and s1.detailid>s2.detailid;

 ---TASK 5---

 ;with red_details as(
 select detailid
 from details
 where color='Red')
 update supplies
 set quantity=quantity*1.1
 where detailid in(select * from red_details)

 ---TASK 6---

 select distinct color, city
 into color_city
 from details;

 ---TASK 7---
 select distinct detailid
 into London_details
 from supplies
 where supplierid IN (select supplierid from suppliers where city='London') OR
 productid IN (select productid from products where city='London');

 ---TASK 8---
 insert into suppliers
 values(10,'White',NULL,'New York');

 ---TASK 9---

 ---with cascade constraint 
delete from products 
where city= 'Roma';

---without cascade constraint 
delete from supplies  
where productid IN(select productid from products 
where city= 'Roma');

go
CREATE or alter TRIGGER Produts_DELETE 
ON supplies
AFTER DELETE
AS
BEGIN
delete from products 
where city= 'Roma'
END

---TASK 10---
select distinct city into cities
from suppliers
union 
select distinct city  
from details
union
select distinct city 
from products

  ---TASK 11---
  select * from details;
update details
set color='Yellow'
where color='Red' AND weight<15;

---TASK 12---
select productid,city into products_cities
from products
where city like '_o%';

---TASK 13----
update suppliers
set rating=rating+10
where supplierid IN(
select distinct supplierid
from supplies
where quantity>(select AVG(quantity)from supplies));

---TASK 14----
select supplierid, name
into product_1_details
from suppliers 
where supplierid IN(select supplierid from supplies where productid=1);

 ---TASK 15---
 insert into suppliers values
(6,'Pavliuk',15,'Lviv'),
(7,'Datsyshyn',20,'Brody');