use VP_module_5
go 

---1--

;with red_details(detailid,name) as(select detailid,name from details where color='Red'),
red_heavy_details(detailid,name) as (
select red_details.detailid, red_details.name 
from red_details
 inner join details on red_details.detailid=details.detailid
 where weight >=17)
select * from red_heavy_details;

--2 Factorial---
;with factorial(Position, Value) as(
select 1,1
union all
select Position+1,(Position+1)*Value
from factorial
where Position<10
 )
select Position, Value from factorial;

--3 Fibonacci---
 ;with fibonacci as
 (
   Select 1 as Previous,1 as Next ,1 as Position 
   union all
   Select Next,Next + Previous,Position +1 from fibonacci
   where Position  <20
 )
 Select Position,Previous as Value from fibonacci;

 ---4 ---

;with dates(StartDate,EndDate) as(
select CAST('2013-11-25'as date),CAST((EOMONTH('2013-11-25'))as date)
union all
select CAST(DATEADD(month,DATEDIFF(month,0,(dateadd(month,1,(StartDate)))), 0) as date),
CAST((EOMONTH((dateadd(month,1,StartDate))))as date)
from dates
WHERE EndDate<'2014-02-28'
 )
select StartDate,EndDate
 from dates
union all
select CAST('2014-03-01' as date),CAST('2014-03-05'as date);

--5 Calendar

set DATEFIRST 1;
declare @date as date = '2019-07-06'
;with cte as (
 select 
  dateadd(dd,1,eomonth(dateadd(mm,-1,@date))) firstofmonth,
  eomonth(@date) endofmonth
), cte1 as (
 select dateadd(dd, -1 * ( datepart(weekday, firstofmonth) - 1),firstofmonth) as previousmonday,
  firstofmonth, 
  endofmonth,
  case 
   when datepart(dw,endofmonth) = 1 then endofmonth
   else
   dateadd(dd, 3 - datepart(dw,endofmonth), endofmonth) 
  end as lastsunday
 from cte
), cte2 as (
 select 
  1 cnt, previousmonday as calendarday, lastsunday
 from cte1

 union all

 select 
  cnt+1, dateadd(dd, 1, calendarday) as calendarday, lastsunday
 from cte2
 where
  dateadd(dd, 1, calendarday) <= lastsunday
),
 calendar as (
 select 
  cnt,
 ((cnt-1)/7)+1 weeknumber,
 calendarday, 
 datename(dw,calendarday) nameofday,
 case when (cnt % 7) = 1 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Monday,
 case when (cnt % 7) = 2 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Tuesday,
 case when (cnt % 7) = 3 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Wednesday,
 case when (cnt % 7) = 4 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Thursday,
 case when (cnt % 7) = 5 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Friday,
 case when (cnt % 7) = 6 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Saturday,
 case when (cnt % 7) = 0 and month(calendarday) = month(@date) then cast(day(calendarday) as varchar) else null end as Sunday
from cte2
)
select
 max(Monday) Monday,
 max(Tuesday) Tuesday,
 max(Wednesday) Wednesday,
 max(Thursday) Thursday,
 max(Friday) Friday,
 max(Saturday) Saturday,
 max(Sunday) Sunday
from calendar
group by weeknumber

