--Date format
--Formatting:Changing the format of a value from one to another.(Changing how the data looks).
--Casting:Changing the data type from one to another.
--1-FORMAT():Formats a date or time value FORMAT(value,format,[culture])
select
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'MM-dd-yyyy')USA_Format,
	FORMAT(CreationTime,'dd-MM-yyyy')EURO_Format,
	FORMAT(CreationTime,'dd')dd,
	FORMAT(CreationTime,'ddd')ddd,
	FORMAT(CreationTime,'dddd')dddd,
	FORMAT(CreationTime,'MM')MM,
	FORMAT(CreationTime,'MMM')MMM,
	FORMAT(CreationTime,'MMMM')MMMM
from SalesDB.Sales.Orders
--Show creation time using the following format:Day Wed Jan Q1 2025 12:34:56 PM
select 
	OrderID,
	CreationTime,
	'Day '+FORMAT(CreationTime,'ddd MMM')+
	'Q '+DATENAME(QUARTER,CreationTime)+' '+
	FORMAT(CreationTime,'yyyy hh:mm:ss tt') as [Customer Format]
from SalesDB.Sales.Orders

select
FORMAT(OrderDate,'MMM yy') OrderDate,
count(*) 
from SalesDB.Sales.Orders
group by FORMAT(OrderDate,'MMM yy')
--2-Convert:Converts a date or time value to a different data type.
--CONVERT(data_type,value,[style])
select 
OrderID,
CreationTime,
CONVERT(varchar,CreationTime,32) as [USA Std. Style:32],--32 the number of usa style
CONVERT(varchar,CreationTime,34) as [USA Std. Style:34]--32 the number of usa style
from SalesDB.Sales.Orders
--CAST:Converts a value to a specified data type.
--CAST(value as data_type)
select
CAST('2026-04-11' as datetime)as [string to datetime],--convert from string to date + time
CreationTime,
CAST(CreationTime as date) as [Date time to Date]
from SalesDB.Sales.Orders
--DATEADD:Adds or substracts a specific time interval to/from a date.
--DATEADD(part,number,date)
select
OrderID,
OrderDate,
DATEADD(YEAR,1,OrderDate) as ONEYEARLATER
from SalesDB.Sales.Orders
--DATEDIFF:Find the difference between two dates.
--DATEDIFF(part,start_date,end_date)
--Calculate the age of employees
select
EmployeeID,
BirthDate,
DATEDIFF(year,BirthDate,GETDATE()) Age
from SalesDB.Sales.Employees
--Find the average shipping duration in days for each month
select
DATENAME(MONTH,OrderDate) MONTH,
AVG(DATEDIFF(day,OrderDate,ShipDate)) [AVG]
from SalesDB.Sales.Orders
group by DATENAME(MONTH,OrderDate)
--Find the number of days between each order and the previous order
--LAG:to get the previous row
select
OrderID,
OrderDate [Current order date],
LAG(OrderDate) over (order by OrderDate)[Previous order date] ,
DATEDIFF(day,LAG(OrderDate) over (order by OrderDate),OrderDate)[The difference]
from SalesDB.Sales.Orders
--ISDATE:Check if a value is date.Returns 1 if the string value is a valid date
--ISDATE(value)
select
isdate('123'),
isdate('2026-4-15'),
isdate('4-15-2026')