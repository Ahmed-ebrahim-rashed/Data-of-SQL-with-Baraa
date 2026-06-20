--Retrieve All Customer Data
select*from customers
--Retrieve All order Data
select*from orders
--Retrieve each Cutomer's name, country , and score
select 
	first_name,
	country,
	score
from customers
--Using where
--Retrieve customers with a score not equal to 0
select *
from customers
where score !=0
--Retrieve customers from Germany
select *
from customers
where country ='Germany'
--Using order by 
--Retrieve all customers and sort the results by the highest score first
select *
from customers
order by score DESC
/*Retrieve all customers and sort the results
by the country and then by the highest score*/
select*
from customers
order by country asc,score desc
--Using group by 
--Find the total score for each country
select
	country
	,sum(score) AS [Total Score]
from customers
group by country
--Find the total score and total number of customers for each country
select
	country,
	sum(score) AS [Total Score],
	count(*) AS [Number of customers]
from customers
group by country 
/*Find the average score for each country considering only 
customers with a score not equal to 0 and return only 
countries with an average score greater than 430*/
select
	country,
	avg(score) AS [The Average Score]
from customers
where score!=0
group by country
having  AVG(score)>430
--Using distinct to filter data
--Return Unique list of all countries
select distinct
	country 
from customers
--Using top to limit your data
--Retrieve only 3 customers
select top 3*
from customers
--Retrieve the top 3 customers with the gighest scores
select top 3*
from customers
order by score desc
--Retrieve the lowest 2 customers based on the score
select top 2*
from customers
order by score asc
--Get the two most recent orders
select top 2*
from orders
order by order_date desc