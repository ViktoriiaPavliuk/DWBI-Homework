go
use VP_module_2
go
--set negative value to price
INSERT INTO Medical_Procedure (Procedure_id, Procedure_Name,Room,Price)
VALUES (0,'X-ray',4,-15)
GO
--The INSERT statement conflicted with the CHECK constraint "check_price

--set correct(positive) value to price
INSERT INTO Medical_Procedure (Procedure_id, Procedure_Name,Room,Price)
VALUES (1,'X-ray',4,15)
GO 
--Constraint behavior is valid

--set room value beyond the range
INSERT INTO Patient (Patient_id,First_Name,Last_Name,Insurance_number,Hospital_room)
VALUES (0,'Dean', 'Webster','GH7886969',451)
GO
--The INSERT statement conflicted with the CHECK constraint "check_hospital_room". The conflict occurred in database "VP_module_2", table "dbo.Patient", column 'Hospital_room'.

--set room value within range
INSERT INTO Patient (Patient_id,First_Name,Last_Name,Insurance_number,Hospital_room)
VALUES (0,'Dean', 'Webster','GH7886969',430)
GO
--Constraint behavior is valid