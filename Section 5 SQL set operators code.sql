-----------------------------------------------------
--Set operators
-- Set Operators Conditions:
-- 1. Each SELECT statement must have the same number of columns.
-- 2. The corresponding columns must have compatible data types.
-- 3. The columns must be in the same order in all SELECT statements.
-- 4. The columns names in the result set are determined by the column names specified in the first query.
-- 5. Even if all rules are met and SQL shows on errors,the result may be incorrect,incorrect column selection leads to inaccurate results.
--Union:It aggregates the results and removes duplicates.
--Combine the data from employees and customers into one table.
select
	FirstName,
	LastName
from SalesDB.Sales.Customers
union
select
	FirstName,
	LastName
from SalesDB.Sales.Employees
--Unoin All:Returns all rows from both queries,including duplicates.
--Union all faster than union
--Combine the data from employees and customers into one table,including duplicates.
select
	FirstName,
	LastName
from SalesDB.Sales.Customers
union all
select
	FirstName,
	LastName
from SalesDB.Sales.Employees
--Except:Returns all distinct rows from the first query that are not found in the second query.
--Find the employees who are not customers at the same time
select
	FirstName,
	LastName
from SalesDB.Sales.Employees
Except
select
	FirstName,
	LastName
from SalesDB.Sales.Customers
--Intersect:Returns only the rows that are common in both queries
--Find the employees who are also customers
select
	FirstName,
	LastName
from SalesDB.Sales.Employees
intersect
select
	FirstName,
	LastName
from SalesDB.Sales.Customers
------------------------------------------------------------------
--Combine information:combine similar information before analyzing the data using set operators
--orders are stored in separate tables (orders,orders archive) combine all orders into one report without duplicates.
select*from SalesDB.Sales.Orders
union
select*from SalesDB.Sales.OrdersArchive
--Delta detection:identifying differences or changes(delta)between two batches of data.
--Using Except