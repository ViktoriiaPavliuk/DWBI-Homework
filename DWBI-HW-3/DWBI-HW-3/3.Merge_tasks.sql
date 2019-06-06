---TASK 1----
use VP_module_3
go

create table tmp_details(
detailid int not null primary key,
name varchar(20),
color varchar(20),
weight int,
city varchar(20)
);

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (1, 'Screw',         'Blue',     13, 'Osaka');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (2, 'Bolt',           'Pink', 12, 'Tokio');

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (18, 'Whell-24', 'Red',   14, 'Lviv');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (19, 'Whell-28', 'Pink',     15, 'London');

---TASK 2----
use VP_module_3
go
merge details t
using tmp_details s
on (s.detailid=t.detailid)
when matched then
update set 
t.detailid=s.detailid,
t.name=s.name,
t.color=s.color,
t.weight=s.weight,
t.city=s.city
when not matched 
 then insert (detailid, name, color, weight,city)
         values (s.detailid, s.name, s.color,s.weight, s.city);
