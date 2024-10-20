--SQL Server SELECT DISTINCT clause

--SELECT 
--  DISTINCT column_name 
--FROM 
--  table_name;
--Code language: SQL (Structured Query Language) (sql)
--The query will return unique values from the column column_name. In other words, 
--it removes duplicate values from the column_name in the result set.

--If you use the DISTINCT clause with multiple columns as follows:

--SELECT DISTINCT
--	column_name1,
--	column_name2 ,
--	...
--FROM
--	table_name;
use BikeStores;
--1) Using the SELECT DISTINCT with one column
SELECT DISTINCT city 
FROM sales.customers 
ORDER BY city;

--2) Using SELECT DISTINCT with multiple columns
SELECT  DISTINCT city, state
FROM sales.customers
ORDER BY state DESC;

--3) Using SELECT DISTINCT with NULL
SELECT DISTINCT phone
FROM sales.customers
ORDER BY phone;

--DISTINCT vs. GROUP BY
--using GROUP BY
SELECT 
  city, 
  state, 
  zip_code 
FROM 
  sales.customers 
GROUP BY 
  city, 
  state, 
  zip_code 
ORDER BY 
  city, 
  state, 
  zip_code

--Using Distinct
SELECT DISTINCT city, state, zip_code 
FROM sales.customers;
