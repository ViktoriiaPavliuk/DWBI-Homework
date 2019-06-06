go
use VP_module_2
GO

---trigger creation
CREATE or alter TRIGGER P_DELETE	
ON User_Info
AFTER DELETE
AS
BEGIN
DECLARE @id int = (SELECT MAX(Operation_id) + 1 FROM Operation_History)
INSERT INTO Operation_History (Operation_id, Type_of_Operation)
SELECT @id, 'deleted'
END

--- deleting data
DELETE from User_Info
WHERE First_Name='Lora';

---checking if trigger worked
SELECT * from Operation_History;

