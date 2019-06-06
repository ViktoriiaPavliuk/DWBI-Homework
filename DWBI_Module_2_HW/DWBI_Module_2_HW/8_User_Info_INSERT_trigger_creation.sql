use VP_module_2
GO

--- creating trigger
CREATE or alter TRIGGER User_Info_INSERT
ON User_Info
AFTER INSERT
AS
begin
declare @id int = (select max(Operation_id) + 1 from Operation_History)
 insert into Operation_History 
    (Operation_id, Type_of_Operation, Date_of_Operation)
 select @id, 'inserted', GETDATE()
end

---incerting data
INSERT INTO User_Info VALUES
(4,'Lora','Smith','Jane','1998-01-01','+38(068)-023-32-30','lora.jane.smith@gmail.com"', 'MasterCard','8908-8888-9696-3232','2020-09-01',225,'kitty',2223.03);

---checking if trigger worked 
SELECT * from Operation_History;