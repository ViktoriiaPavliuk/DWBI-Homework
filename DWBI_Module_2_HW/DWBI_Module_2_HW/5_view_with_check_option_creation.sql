use VP_module_2
go
create or alter view D_patients
as
select Patient_ID,First_Name,Last_Name
from Patient
where Last_Name LIKE 'D%'
with check option;
go 