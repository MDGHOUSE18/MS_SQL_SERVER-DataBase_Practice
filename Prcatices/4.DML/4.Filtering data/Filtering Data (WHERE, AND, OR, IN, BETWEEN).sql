--SQL Server WHERE Clause

--The SELECT statement retrieves all rows from a table. However, 
--this is often unnecessary because the application may only need to process a subset of rows at the time.

--To retrieve rows that satisfy one or more conditions, you use the WHERE clause in the SELECT statement.

--Syntax
--SELECT
--    select_list
--FROM
--    table_name
--WHERE
--    search_condition;

--1) Using the WHERE clause with a simple equality operator

SELECT * FROM production.products
Where product_id=1;

--2) Using the WHERE clause with the AND operator

--AND operator
--The AND is a logical operator that allows you to combine two Boolean expressions. It returns TRUE only when both expressions are evaluated to TRUE.

--The following illustrates the syntax of the AND operator:
--Syntax : boolean_expression AND boolean_expression 

SELECT product_id,product_name,category_id,model_year,list_price
FROM production.products
Where category_id=1 AND model_year=2016
order by list_price DESC;

--3) Using WHERE to filter rows using a comparison operator
--The following statement finds the products with a list price greater than 1000 and the model of 2017.
SELECT product_id,product_name,category_id,model_year,list_price
FROM production.products
Where list_price > 1000 AND model_year=2017
order by product_id;

--4) Using the WHERE clause to filter rows that meet any of two conditions
--The following query uses a WHERE clause to find products that meet either condition: a list price greater than 3,000 or the model of 2018:
--OR operator
--The SQL Server OR is a logical operator that allows you to combine two Boolean expressions. It returns TRUE when either of the conditions evaluates to TRUE.

--The following shows the syntax of the OR operator:
--Syntax : boolean_expression OR boolean_expression

SELECT * from production.products
WHERE list_price>3000 OR model_year=2018
ORDER BY product_name;

--5) Using the WHERE clause to filter rows with the value between two values
--The following statement finds the products with list prices between 1,899 and 1,999.99:

--BETWEEN operator
--The BETWEEN operator is a logical operator that allows you to specify a range to test.
--The following illustrates the syntax of the BETWEEN operator:
--column | expression BETWEEN start_expression AND end_expression

--To negate the result of the BETWEEN operator, you use NOT BETWEEN operator as follows:
--column | expression NOT BETWEEN start_expression AND end_expresion

SELECT * FROM production.products
WHERE list_price BETWEEN 1899 AND 1999.99
ORDER BY list_price DESC;


--6) Using the WHERE clause to filter rows that have a value in a list of values
--The following example uses the IN operator to find products with a list price of 299.99, 466.99, or 489.99.
--IN operator
--The IN operator is a logical operator that allows you to check whether a value matches any value in a list.

--The following shows the syntax of the SQL Server IN operator:

--Syntax : column | expression IN ( v1, v2, v3, ...)

SELECT * FROM production.products
WHERE list_price IN(299.99,399.99,489.99)
ORDER BY list_price DESC;

--7) Finding rows whose values contain a string
--The following example uses the LIKE operator to find products whose name contains the string Cruiser:
SELECT * FROM production.products
WHERE product_name LIKE '%Cruiser%'
ORDER BY list_price;