go
use VP_module_2
go

---  trigger creation
CREATE or alter TRIGGER User_Info_UPDATE
ON User_Info
AFTER UPDATE
AS
begin
declare @id int = (select max(Operation_id) + 1 from Operation_History)
INSERT INTO Operation_History ( Operation_id,Type_of_Operation, Date_of_Operation)
SELECT @id,'updated', GETDATE() 
end

-- incerting values 
INSERT INTO User_Info VALUES
(12,'Lora','Smith','Jane','1998-01-01','+38(068)-023-32-30','lora.jane.smith@gmail.com"', 'MasterCard','8978-8888-9696-3232','2020-09-01',223,'kitty',2223.03),
(13,'Emily','Smith','Lauren','1998-01-01','+38(098)-153-25-39','emily.smith@gmail.com"', 'MasterCard','8978-8455-9191-1132','2020-03-01',512,'puppy',33.7);

--- updating values 
UPDATE User_Info 
SET Phone_number='+38(098)-153-25-39'
WHERE Phone_number= '+38(093)-225-35-75';

---checking if trigger worked 
SELECt * from Operation_History ;
select * from User_Info;
