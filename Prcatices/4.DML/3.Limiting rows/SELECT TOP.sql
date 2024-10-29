--SQL Server SELECT TOP
--The SELECT TOP clause allows you to limit the rows or percentage of rows returned by a query. 
--It is useful when you want to retrieve a specific number of rows from a large table.

--The following shows the syntax of the TOP clause with the SELECT statement:
--SELECT TOP (expression) [PERCENT]
--    [WITH TIES]
--FROM 
--    table_name
--ORDER BY 
--    column_name;

use EmployeeManagementSystem;
--1) Using SQL Server SELECT TOP with a constant value
SELECT TOP 10 first_name,last_name,job_title,salary 
FROM Staff.Employees
ORDER BY salary DESC;

--2) Using SELECT TOP to return a percentage of rows
SELECT TOP 10 PERCENT 
	first_name,last_name,salary
FROM Staff.Employees
ORDER BY salary;


--3) Using SELECT TOP WITH TIES to include rows that match values in the last row
SELECT TOP 3 WITH TIES
	first_name,last_name,salary
FROM Staff.Employees
ORDER BY salary DESC;

SELECT * FROM Staff.Employees;
