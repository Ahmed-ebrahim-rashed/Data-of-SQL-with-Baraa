--SQL DDL commands
--How to create & alter tables
create table persons(
	id int not null,
	person_name varchar(50),
	birth_date date,
	phone varchar(15)not null,
	constraint pk_persons primary key (id)
)
select*from persons

alter table persons
add email varchar(50)not null

-----------------------------------------------------------
--SQL DML commands
insert into customers(id,first_name,country,score)
values
(6,'Ahmed','Egypt',100),
(7,'Sameh','Egypt',200)
insert into customers(id,first_name,country,score)
values
(8,'Omar','Egypt',NULL),
(9,'Yasser','Egypt',NULL),
(10,'Mazen','Egypt',NULL)
--Insert data from customers into persons
insert into persons(id,person_name,birth_date,phone,email)--It's a target table
select
id,
first_name,
NULL,--make unother column like this in customers table
'Unknown',
'Unknown'--make another column like this in customers table
from customers--It's a source table 
select * from persons
-----------------------------------------------------------
--Update data 
--Change the score of customer with id 6 to 0
select*from customers
UPDATE customers
set score = 0
where id = 6
--Change the score of customer with id 5 to 0 and update the country to 'UK'
UPDATE customers
set score = 0,
country ='UK'
where id=5
--Update all customers with a null score by setting their score to 0
UPDATE customers
set score = 0
where score is NULL

-----------------------------------------------------------
--Delete data 
--Delete all customers with id greater than 5
delete from customers
where id>5
--Truncate:clears the whole table at once without checking or logging
--Delete all data from the persons table
truncate table persons
--Note:truncate like delete but truncate quicker than delete