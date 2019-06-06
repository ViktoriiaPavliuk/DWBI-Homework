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

 ---TASK 5---

 ;with red_details as(
 select detailid
 from details
 where color='Red')
 update supplies
 set quantity=quantity*1.1
 where detailid in(select * from red_details)

 ---TASK 15---
 insert into suppliers values
(6,'Pavliuk',15,'Lviv'),
(7,'Datsyshyn',20,'Brody');