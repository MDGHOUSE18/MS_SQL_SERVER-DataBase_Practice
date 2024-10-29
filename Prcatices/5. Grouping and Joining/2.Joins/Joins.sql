use ECommercePlatform;

--SQL Server INNER JOIN clause
--In SQL Server, JOIN operations are used to combine rows from two or more tables based on related columns between them. Here's a breakdown of the different types of JOINs in SQL Server:
--1. INNER JOIN
--The INNER JOIN returns only the rows where there is a match in both tables.

--Syntax:
--	SELECT column_name(s)
--	FROM table1
--	INNER JOIN table2
--	ON table1.column_name = table2.column_name;
--Example:
--	SELECT Employees.EmployeeID, Employees.Name, Orders.OrderID
--	FROM Employees
--	INNER JOIN Orders
--	ON Employees.EmployeeID = Orders.EmployeeID;

SELECT user_id,username,role_name 
FROM UserManagement.Users u
INNER JOIN UserManagement.Roles r ON u.user_id=r.role_id;

--2. LEFT JOIN (or LEFT OUTER JOIN)
--The LEFT JOIN returns all rows from the left table and the matched rows from the right table. If there's no match, NULL values are returned from the right table.

--Syntax:
--	SELECT column_name(s)
--	FROM table1
--	LEFT JOIN table2
--	ON table1.column_name = table2.column_name;
--Example:
--	SELECT Employees.EmployeeID, Employees.Name, Orders.OrderID
--	FROM Employees
--	LEFT JOIN Orders
--	ON Employees.EmployeeID = Orders.EmployeeID;

SELECT first_name, last_name, username, role_id
FROM UserManagement.Users u
LEFT JOIN UserManagement.Profiles p ON u.profile_id=p.profile_id;


--3. RIGHT JOIN (or RIGHT OUTER JOIN)
--The RIGHT JOIN returns all rows from the right table and the matched rows from the left table. If there's no match, NULL values are returned from the left table.

--Syntax:
--	SELECT column_name(s)
--	FROM table1
--	RIGHT JOIN table2
--	ON table1.column_name = table2.column_name;

SELECT username, role_name
FROM UserManagement.Users u
RIGHT JOIN UserManagement.Roles r ON u.user_id = r.role_id;

--4. FULL JOIN (or FULL OUTER JOIN)
--The FULL JOIN returns all rows where there is a match in either table. If there is no match, NULL values will be returned for non-matching rows from both tables.

--Syntax:
--	SELECT column_name(s)
--	FROM table1
--	FULL JOIN table2
--	ON table1.column_name = table2.column_name;

SELECT username, role_name
FROM UserManagement.Users u
FULL JOIN UserManagement.Roles r 
ON u.user_id = r.role_id;

--5. CROSS JOIN
--The CROSS JOIN returns the Cartesian product of the two tables, meaning it will combine all rows from the first table with all rows from the second table.

--Syntax:
--	SELECT column_name(s)
--	FROM table1
--	CROSS JOIN table2;

SELECT username, role_name
FROM UserManagement.Users
CROSS JOIN UserManagement.Roles;

--6. SELF JOIN
--A SELF JOIN is when a table is joined with itself.

--Syntax:
--	SELECT a.column_name, b.column_name
--	FROM table1 a, table1 b
--	WHERE condition;

SELECT u1.user_id,u1.username,u2.profile_id
FROM UserManagement.Users u1
RIGHT JOIN UserManagement.Users u2 ON u1.user_id = u2.profile_id;

--7. NATURAL JOIN
--SQL Server doesn't explicitly support NATURAL JOIN, but it can be simulated by using an INNER JOIN where the columns in the ON condition are identical.

--Example Simulation:
--	SELECT *
--	FROM table1
--	INNER JOIN table2
--	ON table1.common_column = table2.common_column;

