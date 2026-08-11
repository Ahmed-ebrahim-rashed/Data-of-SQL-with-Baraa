---------------------------------------------------------------------------------
--CASE STATEMENT:Evaluates a list of conditions and returns a value when the first condition is met
/*
CASE 
	WHEN condition1 THEN result1

	WHEN condition2 THEN result2

	ELSE 
END
*/
/* Generate a report showing the total sales for each category:
-High:if the sales higher than 50
-Medium:if the sales between 20 and 50
-Low:if the sales equal or lower than 20
sort the result from lowest to highest
*/
select 
Category,
sum(Sales) as [Total Sales]
from(
select
OrderID,
Sales,
CASE 
	when sales > 50 THEN 'High'
	when sales > 20 THEN 'Medium'
	ELSE 'Low'
END Category
from SalesDB.Sales.Orders
)t --t is an alias name for Subquery
group by Category
order by [Total Sales] desc
--NOTE:The data type after THEN and after ELSE must be matching

--Retrieve employee details with gender displayed as full text
select
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	when Gender = 'M' then 'Male'
	when Gender = 'F' then 'Female'
	else 'Not Avaiable'
END [Gender Full Text]
from SalesDB.Sales.Employees

--Retrieve customer details with abbreviated country code
select
CustomerID,
FirstName,
LastName,
Country,
--Full Form
CASE 
	when Country = 'Germany' then 'DE'
	when Country = 'USA' then 'US'
	else 'n/a'
END [Abbreviated Counrtry Code],
--Quick Form
CASE Country
	when 'Germany' then 'DE'
	when 'USA' then 'US'
	else 'n/a'
END [Abbreviated Counrtry Code]
from SalesDB.Sales.Customers

--Find the average scores of customers and treat NULLs as 0 , Additionally provide details such CustomerID and LastName
select
CustomerID,
FirstName,
LastName,
Score,
AVG(Score) over(),
CASE
	when Score is null then 0
	else Score
END [Score Clean],
AVG
(
CASE
	when Score is null then 0
	else Score
END
)  over() as [AVG Customer Clean]
from SalesDB.Sales.Customers

--Count how many times each customer has made an order with sales greater than 30
select 
CustomerID,
Sum(
CASE 
	when Sales > 30 then 1
	else 0
END ) [Total Orders High Sales],
count(*) [Total Orders]
from SalesDB.Sales.Orders
group by CustomerID
