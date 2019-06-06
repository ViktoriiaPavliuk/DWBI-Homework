use demo_database
go
CREATE SYNONYM VP.NewMedical_Procedure  
FOR VP_module_2.dbo.Medical_Procedure;  
GO  
go
 select * from VP.NewMedical_Procedure ;
go
select * from sys.tables
go