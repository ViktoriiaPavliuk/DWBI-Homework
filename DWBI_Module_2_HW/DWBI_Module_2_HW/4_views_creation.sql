use VP_module_2
go 
--View for Patient table
create or alter view patients_of_doctor_Harington
as
select Patient_ID,First_Name,Last_Name,Doctor
from Patient
where Doctor='Harington K.'
go 

--View for  Medical_Procedure table 
create or alter view short_procedures
as
select 
Procedure_ID,Procedure_Name,Duration_min
from Medical_Procedure
where Duration_min BETWEEN 10 AND 30
go 

