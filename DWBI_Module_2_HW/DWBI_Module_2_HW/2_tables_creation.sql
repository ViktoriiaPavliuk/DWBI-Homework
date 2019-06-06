use VP_module_2

go
drop table if exists Patient
go

CREATE TABLE Patient(
Patient_id int NOT NULL PRIMARY KEY,
First_Name varchar(30)NOT NULL,
Last_Name varchar(30)NOT NULL,
Birth_Date date,
Phone_Number varchar(20),
Insurance_number varchar(20) NOT NULL UNIQUE,
Doctor varchar(50) ,
Hospital_room int,
Incerted_date date DEFAULT GETDATE(),
Updated_date date DEFAULT GETDATE(),
CONSTRAINT check_hospital_room
    CHECK (Hospital_room BETWEEN 1 and 450),
);

go
drop table if exists Medical_Procedure
go

 CREATE TABLE Medical_Procedure(
Procedure_id int NOT NULL PRIMARY KEY,
Procedure_Name varchar(30) NOT NULL ,
Nurce varchar(60),
Patient int FOREIGN KEY REFERENCES Patient(Patient_id),
Room varchar(50) NOT NULL,
Price int,
Duration_min int,
Frequency varchar(60),
Incerted_date datetime,
Updated_date datetime,
CONSTRAINT check_price
    CHECK (Price>=0)
);

INSERT INTO Patient VALUES 
(0,'Kate', 'Smith','1998-04-04','+380-68-023-32-30','KB120034','Harington K.',5,'2018-12-12','2018-03-02'),
(1,'Vitaliy', 'Datsyshyn','1999-01-01','+380-93-127-12-35','HL10345664','Savenko N.M.',5,'2018-09-22','2018-04-02'),
(2,'Viktoriia', 'Pavliuk','1999-04-24','+380-97-769-22-88','NVP140005','Harington K.',5,'2018-11-02','2018-04-12');


INSERT INTO Medical_Procedure VALUES 
(10,'x-ray','Koval A.M.',0,8,180,10,'once per year','2017-12-02','2018-12-12'),
(11,'massage','Datsiuk N.V.',1,19,400,120,'three times per week','2019-11-02','2018-05-03'),
(12,'enema','Datsiuk N.V.',2,15,50,15,'two times per day','2019-01-02','2018-01-03');
