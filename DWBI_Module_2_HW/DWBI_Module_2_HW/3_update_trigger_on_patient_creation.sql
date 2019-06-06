use VP_module_2

go
drop trigger if exists Patient_UPDATE
go

create trigger Patient_UPDATE ON Patient
AFTER UPDATE
AS
BEGIN
	UPDATE Patient SET Updated_date = GETDATE()
END
GO

