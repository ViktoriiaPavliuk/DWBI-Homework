drop database if exists VP_module_5
go 
create database VP_module_5
go
use VP_module_5
go

drop table if exists supplies
go
drop table if exists suppliers
go
create table suppliers 
(supplierid int not null primary key,
name varchar(20),
rating int,
city varchar(20)
);
drop table if exists details
go
 create table details
 (detailid int not null primary key,
 name varchar(20),
 color varchar (20),
 weight int,
 city varchar(20)
 );
 drop table if exists products
go
 create table products 
 (productid int not null primary key,
 name varchar (20),
 city varchar (20)
 );

 create table supplies
 (supplierid int foreign key references suppliers(supplierid),
 detailid int foreign key references details(detailid),
 productid int foreign key references products(productid),
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
 
 drop table if exists [geography]
go
create table [geography]
(id int not null primary key, name varchar(20), region_id int);
go
ALTER TABLE [geography]
       ADD CONSTRAINT R_GB
              FOREIGN KEY (region_id)
                             REFERENCES [geography]  (id);
go

insert into [geography] values (1, 'Ukraine', null);
insert into [geography] values (2, 'Lviv', 1);
insert into [geography] values (8, 'Brody', 2);
insert into [geography] values (18, 'Gayi', 8);
insert into [geography] values (9, 'Sambir', 2);
insert into [geography] values (17, 'St.Sambir', 9);
insert into [geography] values (10, 'Striy', 2);
insert into [geography] values (11, 'Drogobych', 2);
insert into [geography] values (15, 'Shidnytsja', 11);
insert into [geography] values (16, 'Truskavets', 11);
insert into [geography] values (12, 'Busk', 2);
insert into [geography] values (13, 'Olesko', 12);
insert into [geography] values (30, 'Lvivska st', 13);
insert into [geography] values (14, 'Verbljany', 12);
insert into [geography] values (3, 'Rivne', 1);
insert into [geography] values (19, 'Dubno', 3);
insert into [geography] values (31, 'Lvivska st', 19);
insert into [geography] values (20, 'Zdolbuniv', 3);
insert into [geography] values (4, 'Ivano-Frankivsk', 1);
insert into [geography] values (21, 'Galych', 4);
insert into [geography] values (32, 'Svobody st', 21);
insert into [geography] values (22, 'Kalush', 4);
insert into [geography] values (23, 'Dolyna', 4);
insert into [geography] values (5, 'Kiyv', 1);
insert into [geography] values (24, 'Boryspil', 5);
insert into [geography] values (25, 'Vasylkiv', 5);
insert into [geography] values (6, 'Sumy', 1);
insert into [geography] values (26, 'Shostka', 6);
insert into [geography] values (27, 'Trostjanets', 6);
insert into [geography] values (7, 'Crimea', 1);
insert into [geography] values (28, 'Yalta', 7);
insert into [geography] values (29, 'Sudack', 7);
go