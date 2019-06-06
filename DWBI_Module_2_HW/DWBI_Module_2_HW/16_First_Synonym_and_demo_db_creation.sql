CREATE DATABASE demo_database;
go
use demo_database
go
CREATE SCHEMA VP;
GO
CREATE SYNONYM VP.NewPatient  
FOR VP_module_2.dbo.Patient;  
GO  
go
 select * from VP.NewPatient ;
go
select * from sys.tables
go