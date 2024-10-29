--SQL Server OFFSET FETCH
--The OFFSET and FETCH clauses are options of the ORDER BY clause. 
--They allow you to limit the number of rows returned by a query.

use EmployeeManagementSystem;


--1) Using the SQL Server OFFSET FETCH example

SELECT first_name,last_name 
FROM Staff.Employees;

--To skip the first 10 products and return the rest, you use the OFFSET clause as shown in the following statement:
SELECT id,first_name,last_name 
FROM Staff.Employees
ORDER BY id
OFFSET 10 ROWS;

--To skip the first 10 products and select the next 10 products, you use both OFFSET and FETCH clauses as follows:
SELECT id,first_name,last_name 
FROM Staff.Employees
ORDER BY id
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

--2) Using the OFFSET FETCH clause to get the top N rows
SELECT id,first_name,last_name 
FROM Staff.Employees	
ORDER BY id
OFFSET 0 ROWS 
FETCH FIRST 10 ROWS ONLY;

