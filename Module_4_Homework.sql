use [SalesOrders]
go

---TASK 1---
select distinct CustCity
from Customers;

---TASK 2---
select  EmpFirstName, EmpLastName,EmpPhoneNumber
from Employees;

---TASK 3---
select distinct CategoryDescription
from Categories
inner join Products on  Categories.CategoryID=Products.CategoryID;

---TASK 4---
select distinct ProductName, CategoryDescription,WholesalePrice
from Products
inner join Categories on Products.CategoryID=Categories.CategoryID
inner join Product_Vendors on Products.ProductNumber=Product_Vendors.ProductNumber;

---TASK 5---
select VendName
from Vendors
order by VendZipCode;

---TASK 6---
select  EmployeeID,EmpFirstName, EmpLastName,EmpPhoneNumber
from Employees
order by EmpLastName,EmpFirstName;

---TASK 7---
select VendName
from Vendors;

---TASK 8---
select distinct CustState
from Customers;

---TASK 9---
select  distinct ProductName, QuotedPrice
from Products
inner join Order_Details on Products.ProductNumber=Order_Details.ProductNumber;

---TASK 10---
select * from Employees;

---TASK 11---
select VendCity, VendName
from Vendors
order by VendCity;

---TASK 12--- 
select OrderNumber,MAX(DaysToDeliver) as DaysToDeliver
from Product_Vendors
inner join Order_Details on Product_Vendors.ProductNumber=Order_Details.ProductNumber
Group by OrderNumber;

---TASK 13---
select ProductNumber,QuantityOnHand*RetailPrice as StockCost
from Products;

---TASK 14---
select OrderNumber,DATEDIFF(day,OrderDate,ShipDate) as ShipDays
from Orders;

---TASK 2.1 NUMBERS FROM 1 TO 10000---
; with CTE as  
(  
 select 1 Number  
 union all  
 select Number +1 from CTE where Number<10000  
)  
  
select *from CTE  

---TASK 2.2 COUNT WEEKENDS IN THE MONTH---

 WITH ShowDays (D, name)
 AS
 ( 
 SELECT cast ('20190101' as date) as D, datename(WEEKDAY, '20190101')
 UNION ALL 
 SELECT dateadd (day, 1, D), datename (WEEKDAY, dateadd (day,1, D))
 FROM ShowDays
 WHERE D<'20191231'),


 ShowWeekends AS
  (
  SELECT D, name
  FROM ShowDays
  WHERE name in ('Saturday', 'Sunday')
  )

  SELECT COUNT(*) 
  FROM ShowWeekends
  option( MAXRECURSION 365);