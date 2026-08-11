--SQL where conditions
--Retrieve all customers from Germany
select*from customers
where country='Germany'
--Retrieve all customers who are not from Germany
select*from customers
where country!='Germany'--we can write != like <>
--Retrieve all customers with a score greater than 500
select*from customers
where score>500
--Retrieve all customers with a score of 500 or more
select*from customers
where score>=500
--Retrieve all customers with a score less than 500
select*from customers
where score<500
--Retrieve all customers with a score of 500 or less
select*from customers
where score<=500
--Retrieve all customers who are from the USA AND have a score greater than 500
select*from customers
where country='USA' AND score>=500
--Retrieve all customers who are from the USA OR have a score greater than 500
select*from customers
where country='USA' OR score>=500
--Retrieve all customers with a score NOT less than 500
select*from customers
where NOT score<500
--Retrieve all customers whose score falls in the range between 100 and 500
select*from customers
where score between 100 AND 500
--Retrieve all customers from either Germany OR USA
select*from customers
where country IN ('Germany' , 'USA')
--Find all customers whose first name starts with 'M'
select*from customers
where first_name like 'M%'
--Find all customers whose first name ends with 'n'
select*from customers
where first_name like '%n'
--Find all customers whose first name contains 'r'
select*from customers
where first_name like '%r%'
--Find all customers whose first name has 'r' in the third position
select*from customers
where first_name like '__r%'