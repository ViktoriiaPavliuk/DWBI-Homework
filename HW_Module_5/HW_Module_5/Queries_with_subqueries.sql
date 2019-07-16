use VP_module_5
go 
---TASK a--

select distinct s1.productid from supplies as S1
where s1.supplierid = 3
and not exists (
select s2.detailid from supplies as s2
where s2.productid = s1.productid 
and s2.supplierid <> s1.supplierid
)

---TASK b--
SELECT distinct suppliers.supplierid, name
FROM suppliers JOIN supplies on suppliers.supplierid = supplies.supplierid
WHERE detailid = 1 AND quantity> 
(SELECT AVG(supplies.quantity) FROM supplies
WHERE supplies.detailid=supplies.detailid AND supplies.detailid=1);

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
  /*Показати номери деталей, які використовуються принаймні в одному виробі, який поставляється постачальником 2
 тобто визначаємо, всі ід виробів,що постачаються постачальником 2,а далі знаходимо номери деталей,що використовуються в виробах з таким ід*/
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
