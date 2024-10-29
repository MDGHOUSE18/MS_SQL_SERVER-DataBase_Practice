--LIKE operator
--The SQL Server LIKE operator is a logical operator that checks if a character string matches a specified pattern.

--A pattern may include regular characters and wildcard characters. The LIKE operator is used in the WHERE clause of the SELECT, UPDATE, and DELETE statements to filter rows based on pattern matching.

--Here’s the syntax of the LIKE operator:

--	column | expression LIKE pattern [ESCAPE escape_character]

--The pattern is a sequence of characters to search for in the column or expression. It can include the following valid wildcard characters:

	--The percent wildcard (%): any string of zero or more characters.
	--The underscore (_) wildcard: any single character.
	--The [list of characters] wildcard: any single character within the specified set.
	--The [character-character]: any single character within the specified range.
	--The [^]: any character that is not within a list or a range.
	--The wildcard characters make the LIKE operator more flexible than the equal (=) and not equal (!=) string comparison operators.

--Escape character
--The escape character instructs the LIKE operator to treat the wildcard characters as regular characters. The escape character has no default value and must be evaluated to only one character.

--The LIKE operator returns TRUE if the column or expression matches the specified pattern.

--To negate the result of the LIKE operator, you use the NOT operator as follows:

--column | expression NOT LIKE pattern [ESCAPE escape_character]

--1) Using the LIKE operator with the % wildcard examples
--The following example uses the LIKE operator with the % wildcard to find the customers whose last name starts with the letter z:

SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE 'z%'
ORDER BY first_name;

--The following example uses the LIKE operator with the % wildcard to return the customers whose last name ends with the string er:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE '%er'
ORDER BY first_name;

--The following statement uses the LIKE operator to retrieve the customers whose last name starts with the letter t and ends with the letter s:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE 't%s'
ORDER BY first_name;

--2) Using the LIKE operator with the _ (underscore) wildcard example
--The underscore represents a single character. For example, the following statement returns the customers where the second character is the letter u:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE '_u%'
ORDER BY first_name;

--The pattern _u%
--The first underscore character ( _) matches any single character.
--The second letter u matches the letter u exactly.
--The third character % matches any sequence of characters.

--3) Using the LIKE operator with the [list of characters] wildcard example
--The square brackets with a list of characters e.g., [ABC] represents a single character that must be one of the characters specified in the list.
--For example, the following query returns the customers where the first character in the last name is Y or Z:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE '[YZ]%'
ORDER BY last_name;

--4) Using the LIKE operator with the [character-character] wildcard example
--The square brackets with a character range e.g., [A-C] represent a single character that must be within a specified range.
--For example, the following query finds the customers where the first character in the last name is the letter in the range A through C:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE '[A-C]%'
ORDER BY first_name;

--5) Using the LIKE operator with the [^Character List or Range] wildcard example
--For example, the following query returns the customers where the first character in the last name is not the letter in the range A through X:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE last_name LIKE '[^A-X]%'
ORDER BY last_name;

--6) Using the NOT LIKE operator example
--The following example uses the NOT LIKE operator to find customers where the first character in the first name is not the letter A:
SELECT customer_id,first_name,last_name 
FROM sales.customers
WHERE first_name NOT LIKE 'A%'
ORDER BY first_name;

--7) Using the LIKE operator with ESCAPE example
--First, create a new table for the demonstration:

CREATE TABLE sales.feedbacks (
  feedback_id INT IDENTITY(1, 1) PRIMARY KEY, 
  comment VARCHAR(255) NOT NULL
);
--Code language: SQL (Structured Query Language) (sql)
--Second, insert some rows into the sales.feedbacks table:

INSERT INTO sales.feedbacks(comment)
VALUES('Can you give me 30% discount?'),
      ('May I get me 30USD off?'),
      ('Is this having 20% discount today?');
--Code language: SQL (Structured Query Language) (sql)
--Third, query data from the sales.feedbacks table:

SELECT * FROM sales.feedbacks;

--If you want to search for 30% in the comment column, you may come up with a query like this:
SELECT feedback_id,comment
FROM sales.feedbacks
WHERE comment LIKE '%30%';

--The query returns comments that contain 30% and 30 USD, which is not what we expected.
--To address this issue, you can use the ESCAPE clause:
SELECT feedback_id,comment
FROM sales.feedbacks
WHERE comment LIKE '%30!%%' ESCAPE '!';
