--Joins basics
-------------------------------------------------------------------
--Retrieve all data from customers and orders as seperate results
--No join:Returns data from tables without combining them
select*from customers
select*from orders
--Inner join:Return only mathcing Rows from both tables
--Get all customers along with their orders,but only for customers who have placed an order
select*from customers c
inner join orders o
on o.customer_id=c.id
--Left join:Returns all rows from left and only matching from right
--Get all customers along with their orders,including those without orders
select*from customers c
left join orders o
on c.id=o.customer_id
select*from orders o
left join customers c
on c.id=o.customer_id
--Right join:Returns all rows from right and only matching from left
--Get all customers along with their orders,including orders without matching customers
select*from customers c
right join orders o
on c.id=o.customer_id
--TASK
/*Get all cutomers along with their orders,including orders without 
matching customers (using left join) */
select*from orders o
left join customers c
on c.id=o.customer_id
--Full join:Returns all rows from both tables
--Get all customers and all orders,even if ther's no match
select*from customers c
full join orders o
on o.customer_id=c.id
-----------------------------------------------------------
--Advanced join types
--Left anti join:Returns row from left that has no match in right
--Get all customers who haven't placed any order
select*from customers c
left join orders o
on o.customer_id=c.id
where o.customer_id is null
--Right anti join:Returns row from right that has no match in left
--Get all orders without matching customers
select*from customers c
right join orders o
on o.customer_id=c.id
where c.id is null
--Full anti join:Returns only rows that don't match in either tables
--Find customers without orders and orders without customers
select*from customers c
full join orders o
on o.customer_id=c.id
where o.customer_id is null or c.id is null
--Task
/* Get all customers along with their orders but only for customers who 
have placed on an order (without using inner join)*/
select*from customers c
full join orders o
on o.customer_id=c.id
where o.customer_id is not null and c.id is not null
--Cross join:combins every row from left with ever row from right all possible combinations
--Generate all possible combinations of customers and orders
select*from customers--First way
cross join orders
select*from customers ,orders--Second way
----------------------------------------------------------------------
--Joining multiple tables
/*Using SalesDB ,Retrieve a listt of all orders,along with the related
customers,product,and employee details.
Order ID , customer's name,product name,sales amount,product price,
sales person's name*/
select
	o.OrderID,
	o.Sales,
	c.FirstName as [Customer first name],
	c.LastName as [Customer last name],
	p.Product As [Product Name],
	p.Price,
	e.FirstName as [Employee first name],
	e.LastName as [Employee last name]
from 
SalesDB.Sales.Orders o
left join SalesDB.Sales.Customers c
on c.CustomerID=o.CustomerID
left join SalesDB.Sales.Products p
on o.ProductID=p.ProductID
left join SalesDB.Sales.Employees e
on o.SalesPersonID=e.EmployeeID