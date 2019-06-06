use demo_database
go
CREATE SYNONYM VP.NewUser_Info  
FOR VP_module_2.dbo.User_Info;  
GO  
go
 select * from VP.NewUser_Info ;
go
select * from sys.tables
go