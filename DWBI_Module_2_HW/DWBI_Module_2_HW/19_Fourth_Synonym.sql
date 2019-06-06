use demo_database
go
CREATE SYNONYM VP.NewOperation_History  
FOR VP_module_2.dbo.Operation_History;  
GO  
go
 select * from VP.NewOperation_History ;
go
select * from sys.tables
go