use VP_module_2
go
drop table if exists User_Info
go
CREATE TABLE User_Info(
id int  NOT NULL  PRIMARY KEY,
First_Name varchar(20),
Last_Name varchar(20),
Middle_Name varchar(20),
Birth_Date date,
Phone_number varchar(30),
Email_Address varchar(100),
CardType varchar(50),
Card_Number varchar(20)NOT NULL UNIQUE,
Card_Expire_date date,
CVV int check (CVV between 0 and 9999),
Secret_Word varchar(20),
CurrentBalance decimal);

drop table if exists Opertion_History
go
CREATE TABLE Operation_History(
Operation_id int NOT NULL PRIMARY KEY,
Bank varchar(100),
SenderID int  FOREIGN KEY REFERENCES User_Info(id),
ReceiverID int  FOREIGN KEY REFERENCES User_Info(id),
Amount decimal, 
Duration_in_Seconds int,
Comission int,
Transaction_Message varchar(150),
Type_of_Operation varchar (100),
Date_of_Operation datetime  DEFAULT GETDATE());

INSERT INTO User_Info VALUES
(0,'Lora','Smith','Jane','1998-01-01','+38(068)-023-32-30','lora.jane.smith@gmail.com"', 'MasterCard','3978-8888-9696-3232','2020-09-01',223,'kitty',2223.03),
(1,'Emily','Smith','Lauren','1998-01-01','+38(098)-153-25-39','emily.smith@gmail.com"', 'MasterCard','2978-3455-9191-1130','2020-03-01',512,'puppy',33.7);

INSERT INTO Operation_History VALUES
(0,'Ukrsibbank',0,1,245.7,5,5,'Happy Birthday!','incerted',getdate());