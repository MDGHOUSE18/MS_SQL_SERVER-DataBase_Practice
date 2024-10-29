--SQL Server subquery
--A subquery is a query nested inside another statement such as SELECT, INSERT, UPDATE, or DELETE.
--Consider the orders and customers tables from the sample database.

use BikeStores;

--The following statement shows how to use a subquery in the WHERE clause of a SELECT statement to find the sales orders of the customers located in New York:
SELECT order_id,order_date,customer_id
FROM sales.orders
WHERE customer_id IN (
				SELECT customer_id
				FROM sales.customers
				WHERE city='New York'

)ORDER BY order_date DESC;

