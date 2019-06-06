use VP_module_2
go
--set Patient column of medical_procedure to the value that does not exist in Patien_id column of Patient table
INSERT INTO Medical_Procedure(Procedure_id, Procedure_Name,Patient, Room)
Values(13,'X-ray',999,430);
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Medical_P__Patie__57A801BA". The conflict occurred in database "VP_module_2", table "dbo.Patient", column 'Patient_id'.

---set Patient column of medical_procedure to the value that  exists in Patien_id column of Patient table
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (20,'Vika','Pavliuk','GHK859779');

INSERT INTO Medical_Procedure(Procedure_id, Procedure_Name,Patient, Room)
Values(13,'X-ray',20,430);
--Constraint behavior is valid