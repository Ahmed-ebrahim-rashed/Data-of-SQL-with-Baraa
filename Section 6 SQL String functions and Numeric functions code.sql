/*
Functions:A bulilt in SQL code:
accepts an input value
processes it 
returns an output value
1-Single-Row functions
2-Multi-Rows functions
*/
/*
1-String functions
2-Number functions
3-Date & Time functions
4-Null functions
*/
/*
String functions
1-Manipulation:Concat,upper,lower,trim,replace
2-Calculation:len
3-String Extraction:left,right,substring
*/
--Concat:combines multiple strings into one
--Concatenate first name and country into one column
Select 
	first_name,
	country,
	CONCAT(first_name,' ',country)as Name_Country
from customers
--Lower & Upper:converts all chatacters to uppercase or lowercase
--convert the first name to lowercase
select
	first_name,
	LOWER(first_name)as low_name
from customers
--convert the first name to uppercase
select
	first_name,
	UPPER(first_name)as UP_NAME
from customers
--Trim:Removes leading and trailing spaces
--trim,ltrim,rtrim
--Find customers whose first name contains or trailing spaces
select
	first_name,
	len(first_name) len_name,
	len(trim(first_name))len_trim_name,
	len(first_name) - len(trim(first_name)) flag
from customers
where first_name!=TRIM(first_name)
--Replace:replaces specific character with a new character
--Remove dashes (-) from a phone number
select
'123-456-789'as phone,
REPLACE('123-456-789','-','') as clean_phone
--Replace file extence from txt to csv
select
'report.txt'as old_file_name,
REPLACE('report.txt','.txt','.csv')as new_file_name
--LEN:counts how many characters
--Calculate the length of each customer's first name
select
	first_name,
	LEN(first_name) len_first_name
from customers
---------------------------------------------------
--string extraction:left,right,substring
--left:extracts specific number of characters from the start
--Retrieve the first two characters of each first name.
select
	first_name,
	LEFT(trim(first_name),2)as First_Two_Char
from customers
--Retrieve the last two characters of each first name.
select
	first_name,
	RIGHT(first_name,2)as Last_Two_Char
from customers
--Substring:Extract a part of string at a specified position,SUBSTRING(value,start,lenght)
--Retrieve a list of customer's first names removing the first character
select
	first_name,
	SUBSTRING(first_name,2,len(first_name))as Sub_Name
from customers
------------------------------------------------------------------------------
--Numeber functions:Round,Ceil,Floor,ABS,Mod,power,Sqrt,Sign
select
3.512,
Round(3.512,1),--3.500
CEILING(3.512),--4
Floor(3.512),--3
ABS(-3.512),--3.512
POWER(2,3),--8
SQRT(16),--4
SIGN(5)---1 if negative number,1 if positive number
select 10%3;--instead of mod because there isn't mod built-in function in sql