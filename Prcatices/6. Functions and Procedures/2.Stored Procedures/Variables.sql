--What is a variable
--A variable is an object that holds a single value of a specific type e.g., integer, date, or varying character string.

DECLARE @model_year SMALLINT;

--Assigning a value to a variable

SET @model_year = 2018;

--Selecting a record into variables

--First, declare variables that hold the product name and list price:
--To declare multiple variables, you separate variables by commas:
DECLARE 
    @Employee_name VARCHAR(50),
    @Salary DECIMAL(10,2),
	@JobTitle VARCHAR(50);

--Second, assign the column names to the corresponding variables:
SELECT @Employee_name=first_name+' '+last_name,
		@Salary=salary,
		@JobTitle=job_title
FROM Staff.Employees;

--Third, output the content of the variables:
SELECT @Employee_name name,
	@Salary salary,
	@JobTitle profile;


WHERE id=50;


