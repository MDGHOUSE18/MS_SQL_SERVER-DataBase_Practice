--SQL Server GROUP BY clause
--The GROUP BY clause allows you to arrange the rows of a query in groups. The groups are determined by the columns that you specify in the GROUP BY clause.
--The following illustrates the GROUP BY clause syntax:
--SELECT
--    select_list
--FROM
--    table_name
--GROUP BY
--    column_name1,
--    column_name2 ,...;
--In this query, the GROUP BY clause produces a group for each combination of the values in the columns listed in the GROUP BY clause.

use BikeStores;

SELECT customer_id,YEAR (order_date) order_year
FROM sales.orders
WHERE customer_id IN(1,2)
GROUP BY customer_id, YEAR (order_date)
ORDER BY customer_id;

--SQL Server GROUP BY clause and aggregate functions
--For example, the following query returns the number of orders placed by the customer by year:
SELECT customer_id,YEAR (order_date) order_year,COUNT(order_id) order_id
FROM sales.orders
WHERE customer_id IN(1,2)
GROUP BY customer_id, YEAR (order_date)
ORDER BY customer_id;

--For example, the following query will fail:
SELECT customer_id,YEAR (order_date) order_year,order_status
FROM sales.orders
WHERE customer_id IN(1,2)
GROUP BY customer_id, YEAR (order_date)
ORDER BY customer_id;

--More GROUP BY clause examples
--1) Using GROUP BY clause with the COUNT() function example
--The following query returns the number of customers in every city:
SELECT city, COUNT(customer_id) AS coustomer_count
FROM sales.customers
GROUP BY city
ORDER BY city;

--the following query returns the number of customers by state and city
SELECT city,state, COUNT(customer_id) AS coustomer_count
FROM sales.customers
GROUP BY state,city
ORDER BY state,city;

--2) Using GROUP BY clause with the MIN and MAX functions example
--The following statement returns the minimum and maximum list prices of all products with the model 2018 by brand:
SELECT brand_name, MIN(list_price) min_price, MAX(list_price) min_price
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE model_year=2018
GROUP BY brand_name
ORDER BY brand_name;
--In this example, the WHERE clause is processed before the GROUP BY clause, as always.

--3) Using GROUP BY clause with the AVG() function example
--The following statement uses the AVG() function to return the average list price by brand for all products with the model year 2018:
SELECT brand_name,AVG(list_price) avg_price
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE model_year=2018
GROUP BY brand_name
ORDER BY brand_name;

--4) Using GROUP BY clause with the SUM function example
--The following query uses the SUM() function to get the net value of every order:
SELECT order_id, SUM(quantity * list_price * (1 - discount)) net_value
FROM sales.order_items
GROUP BY order_id;


