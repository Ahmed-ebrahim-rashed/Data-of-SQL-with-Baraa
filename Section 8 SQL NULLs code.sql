-----------------------------------------------------------------------------------
/*
NULL functions:ISNULL,
What's NULL?
NULL means nothing,unknown!,NULL is not equal to anything!
*/
--ISNULL:Replaces'NULL'with a specified value
--ISNULL(value,replacement_value)
--COALESCE:Returns the first non-value from a list
--COALESCE(value1,value2,value3,.....)
--Find the average scores of the customers
select
Score,
coalesce(Score,0) as [Score 2],
avg(Score) over() as [Avg scores],
avg(ISNULL(Score,0))over() as [Avg scores 2]
from SalesDB.Sales.Customers
/*Display the full name of customers in a single field by merging their first and last names,
and add 10 bonus points to each customer's score*/
select
FirstName,
LastName,
FirstName + ISNULL(LastName,'') as FullName,
Score,
ISNULL(Score,0)+10 as [Scores after adding]
from SalesDB.Sales.Customers
-----------------------------------------------------------------------------------------
--Handle null - joining tables
select
FirstName,
LastName
from SalesDB.Sales.Customers
select
FirstName,
LastName
from SalesDB.Sales.Employees
select 
c.FirstName,
c.LastName
from SalesDB.Sales.Customers c
join SalesDB.Sales.Employees e
on c.FirstName=e.FirstName
and isnull(c.LastName,'')=isnull(e.LastName,'')
--Handle null - before sorting data
--Sort the customers from lowest to highest scores , with nulls appearing last.
select
Score,
case when Score is null then 1 else 0 end flag 
from SalesDB.Sales.Customers
order by case when Score is null then 1 else 0 end ,Score
--NUllIF:Compares two expressions returns:1-NULL,if they are equal,2-First value,if they are not equal.
--NULLIF(value 1,value 2)
select
NULLIF(Score,350)
from SalesDB.Sales.Customers
--Find the sales price for each order by dividing the dales by the quantity.
select
Sales,
Quantity,
Sales/ NULLIF(Quantity,0) as Price
from SalesDB.Sales.Orders
--ISNULL & IS NOT NULL 
--IS NULL:Returns true if the value is null otherwise it returns false.
--IS NOT NULL:Returns true if the values is NOT NULL otherwise returns false.
--Identify the customers who have no scores
select
*
from SalesDB.Sales.Customers
where Score is  null
--List all customers who have scores
select
*
from SalesDB.Sales.Customers
where Score is not null
------------------------------------------------------------------------------
--NULL vs Empty String vs Blank Space
--NULL:Means nothing,unknown!
--Empty String:String value has zero characters
--Blank Space:String value has one or more space characters
--TRIM:remove unwanted leading and trailing spaces from a string
--TRIM,LTRIM,RTRIM
WITH Orders AS
(
    SELECT 1 id, 'A' Category UNION--length = 1
    SELECT 2, NULL UNION--length = NULL
    SELECT 3, '' UNION--length = 0
    SELECT 4, ' '--length = 1
)
select*,
TRIM(Category) Policy1,
NULLIF(TRIM(Category),'') Policy2,--convert empty string and string has spaces to null
COALESCE(NULLIF(TRIM(Category),''),'unknown')Policy3--convert NULLs,Empty string,string has spaces to unknown
from Orders