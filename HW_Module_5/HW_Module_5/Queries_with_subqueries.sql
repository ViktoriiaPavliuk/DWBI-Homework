use VP_module_5
go 
---TASK a--

select productid 
from 
(select productid from supplies where supplierid=3) supl3;

---TASK b--

select supplierid,name from suppliers
where supplierid in(
select productid from supplies 
where detailid=1 and quantity>
(select AVG(quantity) from supplies 
where detailid=1
group by detailid))

---TASK c--
select distinct detailid,name from details where detailid in(
select distinct detailid from supplies where productid in
(select productid from products where city='London'));

---TASK d--

select distinct suppliers.supplierid, name
from suppliers 
inner join supplies on suppliers.supplierid=supplies.supplierid
where detailid in (select detailid from details where color='Red');

---TASK e--
  --Показати номери деталей, які використовуються принаймні в одному виробі, який поставляється постачальником 2
 --тобто визначаємо, всі ід виробів,що постачаються постачальником 2,а далі знаходимо номери деталей,що використовуються в виробах з таким ід
select distinct detailid from supplies
where productid in (select productid from supplies where supplierid=2)

 ---TASK f--

(select productid from supplies
group by productid 
having AVG(quantity)> (select  MAX(quantity) from supplies where productid=1))

 ---TASK g--

 select distinct productid
 from products
 where productid not in 
 (select distinct productid from supplies);
