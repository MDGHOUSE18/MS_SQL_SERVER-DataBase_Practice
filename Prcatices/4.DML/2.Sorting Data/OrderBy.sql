use EmployeeManagementSystem;

SELECT * FROM Staff.Employees;


--1) Sort a result set by one column in ascending order
SELECT first_name,last_name
FROM Staff.Employees
ORDER BY first_name;


--2) Sort a result set by one column in descending order
SELECT first_name,last_name
FROM Staff.Employees
ORDER BY first_name DESC;

--3) Sort a result set by multiple columns
SELECT CONCAT(first_name, ' ', last_name)AS Full_name,Salary  
FROM Staff.Employees
ORDER BY full_name,salary;


--4) Sort a result set by multiple columns in different orders
SELECT CONCAT(first_name, ' ', last_name)AS Full_name,Salary  
FROM Staff.Employees
ORDER BY full_name DESC,salary ASC;


--5) Sort a result set by a column that is not in the select list
SELECT job_title,first_name,last_name
FROM Staff.Employees
ORDER BY salary;

--6) Sort a result set by an expression
SELECT first_name, last_name 
FROM Staff.Employees
ORDER BY LEN(first_name);

--7) Sort by ordinal positions of columns
SELECT first_name, last_name 
FROM Staff.Employees
ORDER BY 1,2;