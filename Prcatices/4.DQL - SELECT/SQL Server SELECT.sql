use EmployeeManagementSystem;

CREATE SCHEMA Staff;

--1) Using the SQL Server SELECT to retrieve all columns of a table
SELECT * FROM Staff.Employees;

--2) Basic SQL Server SELECT statement example

SELECT empName,title FROM Staff.Employees;

--In the following section, we’ll briefly introduce the additional clauses of the SELECT statement:
--WHERE : filter rows in the result set.
--ORDER BY: sort rows in the result set by one or more columns.
--GROUP BY: group rows into groups.
--HAVING: filter groups.

--3) Filtering rows using the WHERE clause
--If the SELECT statement includes both WHERE and FROM clauses, 
--SQL Server processes them in the following sequence: FROM, WHERE, and SELECT.
SELECT empID,empName,email,gender 
FROM staff.Employees
WHERE gender = 'Male';

--4) Sorting rows using the ORDER BY clause
--When the SELECT statement includes the FROM, WHERE, and ORDER BY clause, 
--SQL Server processes them in the following order: FROM, WHERE, SELECT, and ORDER BY:
SELECT empID,empName,email,gender 
FROM staff.Employees
WHERE gender = 'Female'
ORDER BY empName;

--5) Grouping rows into groups
--In this case, SQL Server processes the clauses in the following order: 
--FROM, WHERE, GROUP BY, SELECT, and ORDER BY.
SELECT gender,COUNT(*) AS gender_count
FROM Staff.Employees
GROUP BY gender
ORDER BY gender;

--6) Filtering groups using the HAVING clause
--Notice that the WHERE clause filters rows while the HAVING clause filter groups.
SELECT gender,COUNT(*) AS gender_count
FROM Staff.Employees
GROUP BY gender
HAVING COUNT(*) <100
ORDER BY gender;


