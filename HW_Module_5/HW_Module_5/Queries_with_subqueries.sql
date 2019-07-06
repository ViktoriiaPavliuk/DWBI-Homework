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

select distinct detailid from supplies where productid in
(select productid from products where city='London');

---TASK d--

select distinct suppliers.supplierid, name
from suppliers 
inner join supplies on suppliers.supplierid=supplies.supplierid
where detailid in (select detailid from details where color='Red');

---TASK e--

select distinct detailid from supplies
 where supplierid in (select distinct supplierid from supplies where supplierid=2);

 ---TASK f--

(select productid from supplies
group by productid 
having AVG(quantity)> (select  MAX(quantity) from supplies where productid=1))

 ---TASK g--

 select distinct productid
 from products
 where productid not in 
 (select distinct productid from supplies);
