drop database if exists [VP_module_3]
go
create database VP_module_3;
use VP_module_3
go
drop table if exists [dbo].[suppliers]
go
create table suppliers(
supplierid int not null primary key,
name varchar(20),
rating int,
city varchar (20)
);
drop table if exists [dbo].[details]
go
create table details(
detailid int not null  primary key,
name varchar(20),
color varchar(20),
weight int,
city varchar(20),
);
drop table if exists [dbo].[products]
go
create table products(
productid int not null primary key,
name varchar(20),
city varchar(20)
);
drop table if exists [dbo].[supplies]
go
create table supplies(
supplierid int foreign key references suppliers(supplierid),
detailid int foreign key references details(detailid),
productid int foreign key references products(productid) ON DELETE CASCADE,
quantity int
);

insert into suppliers values
(1,'Smith',20,'London'),
(2,'Jonth',10,'Paris'),
(3,'Blacke',30,'Paris'),
(4,'Clarck',20,'London'),
(5,'Adams',30,'Athens');

insert into details values 
(1,'Screw','Red',12,'London'),
(2,'Bolt','Green',17,'Paris'),
(3,'Male-screw','Blue',17,'Roma'),
(4,'Male-screw','Red',14,'London'),
(5,'Whell','Blue',12,'Paris'),
(6,'Bloom','Red',19,'London');


insert into products values
(1,'HDD', 'Paris'),
(2,'Perforator', 'Roma'),
(3,'Reader','Athens'),
(4,'Printer','Athens'),
(5,'FDD','London'),
(6,'Terminal','Oslo'),
(7, 'Ribbon','London');

insert into supplies values
(1,1,1,200),
(1,1,4,700),
(2,3,1,400),
(2,3,2,200),
(2,3,3,200),
(2,3,4,500),
(2,3,5,600),
(2,3,6,400),
(2,3,7,800),
(2,5,2,100),
(3,3,1,200),
(3,4,2,500),
(4,6,3,300),
(4,6,7,300),
(5,2,2,200),
(5,2,4,100),
(5,5,5,500),
(5,5,7,100),
(5,6,2,200),
(5,1,4,100),
(5,3,4,200),
(5,4,4,800),
(5,5,4,400),
(5,6,4,500);
 