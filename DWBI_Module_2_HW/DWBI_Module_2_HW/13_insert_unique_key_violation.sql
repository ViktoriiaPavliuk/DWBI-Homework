use VP_module_2
go

-- initial unique key 
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (8,'Vika','Pavliuk','GH88599');

-- unique key violation 
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (9,'Vika','Pavliuk','GH88599');
--Violation of UNIQUE KEY constraint 'UQ__Patient__3536DC5B77232D5E'. Cannot insert duplicate key in object 'dbo.Patient'. The duplicate key value is (GH88599)

--distinct unique key
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (9,'Vika','Pavliuk','GHLK8599');
--Constraint behavior is valid