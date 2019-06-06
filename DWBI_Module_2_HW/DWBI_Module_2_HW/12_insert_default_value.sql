use VP_module_2
go
--set default value to Incerted_date and Updated_date
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (7,'Vika','Pavliuk','GHJ88899')
go
select * from Patient
go
--Constraint behavior is valid

--set default value to Date_of_Operation
INSERT INTO Operation_History (Operation_id)
VALUES (7)
go
select * from Operation_History
go
--Constraint behavior is valid