use VP_module_2
go

-- initial primary key 
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (4,'Vika','Pavliuk','GH8599');

-- primary key violation 
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (4,'Vika','Pavliuk','ZDF88599');
--Violation of PRIMARY KEY constraint 'PK__Patient__C1A16F516B53FAB4'. Cannot insert duplicate key in object 'dbo.Patient'. The duplicate key value is (4).

--distinct primary key
INSERT INTO Patient(Patient_id,First_Name,Last_Name,Insurance_number)
VALUES (2,'Vika','Pavliuk','ZDF88599');
--Constraint behavior is valid