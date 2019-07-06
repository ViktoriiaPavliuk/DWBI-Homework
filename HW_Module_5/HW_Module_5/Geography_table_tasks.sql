use VP_module_5
go 

--Task 1- table creation -in DB_creation.sql---
--TASK 2--
WITH regions_of_level1 (region_id,id,name,PlaceLevel)
 as
(SELECT region_id,id ,name, PlaceLevel=1
FROM  geography
WHERE region_id=1
) 
SELECT * FROM regions_of_level1;

--TASK 3--
 WITH region_tree (region_id, place_id, name, PlaceLevel)
 AS
 (SELECT region_id, id, name, PlaceLevel=-1
 FROM geography
 WHERE name='Ivano-Frankivsk'
 UNION ALL
 SELECT geography.region_id, geography.id, geography.name, region_tree.PlaceLevel+1
 FROM geography INNER JOIN region_tree
 ON geography.region_id=region_tree.place_id
 )
 SELECT region_id, place_id, name, PlaceLevel
 FROM region_tree
 WHERE PlaceLevel>=0;

 --TASK 4--
 WITH region_tree (region_id, place_id, name, PlaceLevel)
 AS
 (SELECT region_id, id, name, PlaceLevel=0
 FROM geography
 WHERE name='Ukraine'
 UNION ALL
 SELECT geography.region_id, geography.id, geography.name, region_tree.PlaceLevel+1
 FROM geography INNER JOIN region_tree
 ON geography.region_id=region_tree.place_id
 )
 SELECT region_id, place_id, name, PlaceLevel
 FROM region_tree
 order by PlaceLevel;


--TASK 5--
with Lviv_tree(name, id, region_id,level) as
(select name, id,region_id,level=1 from geography
where name='Lviv'
union all 
select geography.name,geography.id, geography.region_id, Lviv_tree.level+1
from geography inner join Lviv_tree on
geography.region_id=Lviv_tree.id
)
select name,id,region_id,level 
from Lviv_tree;


--TASK 6--
select  * from geography;




