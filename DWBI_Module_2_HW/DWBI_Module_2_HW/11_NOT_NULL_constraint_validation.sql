use VP_module_2
go
--set NULL value to Procedure_Name  and Room
INSERT INTO Medical_Procedure (Procedure_id,Procedure_Name, Nurce,Duration_min,Room)
VALUES (0,NULL,'Pavliuk L.M.',50,NULL)
GO
--Cannot insert the value NULL into column 'Procedure_Name', table 'VP_module_2.dbo.Medical_Procedure'; column does not allow nulls.

--set a value to Procedure_Name and NULL value to Room
INSERT INTO Medical_Procedure (Procedure_id,Procedure_Name, Nurce,Duration_min,Room)
VALUES (0,'X-ray','Pavliuk L.M.',50, NULL)
GO
--Cannot insert the value NULL into column 'Room', table 'VP_module_2.dbo.Medical_Procedure'; column does not allow nulls.

--set values both to Procedure_Name  and Room
INSERT INTO Medical_Procedure (Procedure_id,Procedure_Name, Nurce,Duration_min,Room)
VALUES (0,'X-ray','Pavliuk L.M.',50, 4)
GO

SELECT * from Medical_Procedure;
--Constraint behavior is valid