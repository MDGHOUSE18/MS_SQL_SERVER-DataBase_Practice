--column alias
--In SQL Server, an alias is a temporary name assigned to a table or column in a query to make it easier to reference or improve readability. Aliases are typically used with the AS keyword, but the AS keyword is optional for column aliases.
--Types of Aliases:
--1. Column Alias
--A column alias is used to give a column a temporary name, making the result set easier to understand. You can create a column alias using the AS keyword, though it’s optional.
--Syntax:
	--SELECT column_name AS alias_name
	--FROM table_name;
--If you have a Customers table with first_name and last_name columns, and you want to display them together as Full_Name, you would use:
SELECT first_name+' '+last_name AS Full_Name
FROM sales.customers;

--Table Alias
--A table alias is used to give a table a short name, which can make queries more concise, especially when you are working with multiple tables or performing joins.
--Syntax:
	--SELECT alias_name.column_name
	--FROM table_name AS alias_name;
SELECT c.customer_id, first_name, last_name, order_id
FROM sales.customers c
INNER JOIN sales.orders o ON o.customer_id = c.customer_id;



