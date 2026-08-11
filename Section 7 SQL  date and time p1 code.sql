------------------------------------------------------------------------------
--Date & Time functions
select
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime,
	'2025-08-20' HardCoded,
	GETDATE() Today--the current day & time
from SalesDB.Sales.Orders
/*
Date & Time functions
1-Part Extraction
2-Format & Casting
3-Calculations
4-Validation
*/
------------------------------------------------------------------------------
--Part Extraction:To request part of history
--Part Extraction:DAY,MONTH,YEAR,DATEPART,DATENAME,DATETRUNC,EOMONTH
--DAY|MONTH|YEAR:Returns the day or month or year from date
select
	OrderID,
	CreationTime,
	YEAR(CreationTime) as Year,
	MONTH(CreationTime) as Month,
	DAY(CreationTime) as Day
from SalesDB.Sales.Orders
--DATEPART:To request part of history,DATEPART(part,date)
select
	OrderID,
	CreationTime,
	DATEPART(YEAR,CreationTime) as Year_dp,
	DATEPART(MONTH,CreationTime) as Month_dp,
	DATEPART(DAY,CreationTime) as Day_dp,
	DATEPART(HOUR,CreationTime) Hour_dp,
	DATEPART(QUARTER,CreationTime)Quarter_dp,
	DATEPART(WEEK,CreationTime)Week_dp,
	DATEPART(MINUTE,CreationTime)Minute_dp,
	DATEPART(SECOND,CreationTime) Second_dp
from SalesDB.Sales.Orders
--DATENAME:Returns the name of a specific part of a date,DATENAME(part,date)
--Note:DATENAME(weekday)return the name of day,DATENAME(day)return the number of day
select
	OrderID,
	CreationTime,
	DATENAME(MONTH,CreationTime)Month_dn,
	DATENAME(WEEKDAY,CreationTime)Weekday_dn,
	DATENAME(day,CreationTime)day_dn,
	DATENAME(year,CreationTime)Year_dn
from SalesDB.Sales.Orders
--DATETRUNC:Truncates the date to the specific part,DATETRUNC(part,date)
select
	OrderID,
	CreationTime,
	DATETRUNC(MONTH,CreationTime)Month_dt,
	DATETRUNC(WEEK,CreationTime)Weekday_dt,
	DATETRUNC(day,CreationTime)day_dt,
	DATETRUNC(year,CreationTime)Year_dt,
	DATETRUNC(hour,CreationTime)hour_dt,
	DATETRUNC(minute,CreationTime)minute_dt
from SalesDB.Sales.Orders
--EOMONTH:Returns the last day of a month,EOMONTH(date)
select
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) [End of Month],
	DATETRUNC(MONTH,CreationTime)[Start of Month]
from SalesDB.Sales.Orders
--How many orders were placed each year
select
	Year(OrderDate),
	COUNT(*) [Number of orders]
from SalesDB.Sales.Orders
group by Year(OrderDate)
--How many orders were placed each month
select
	DATENAME(MONTH,OrderDate),
	COUNT(*) [Number of orders]
from SalesDB.Sales.Orders
group by DATENAME(MONTH,OrderDate)
--Show all orders that were placed during the month of february
select*from SalesDB.Sales.Orders
where Month(OrderDate)=2