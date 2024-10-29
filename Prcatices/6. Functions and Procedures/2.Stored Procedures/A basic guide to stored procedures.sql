--Creating a Stored Procedure
CREATE PROCEDURE uspEmployeeList
AS
BEGIN
	SELECT first_name,last_name,job_title,salary
	FROM Staff.Employees
	ORDER BY first_name;
END;

--2. Executing a Stored Procedure
uspEmployeeList
EXECUTE uspEmployeeList;
EXEC uspEmployeeList;

--3. Modifying a Stored Procedure
ALTER PROCEDURE uspEmployeeList
AS
BEGIN
	SELECT first_name,last_name,job_title,salary
	FROM Staff.Employees
	ORDER BY salary;
END;

--4. Dropping a Stored Procedure
DROP PROCEDURE uspEmployeeList;

--5. Creating a Stored Procedure with one Parameter
CREATE PROCEDURE GetEmployeeById
	@EmployeeId INT
AS
BEGIN
	SELECT id,first_name,last_name,job_title,salary
	FROM Staff.Employees
	WHERE id=@EmployeeId;
END;

EXECUTE GetEmployeeById 1;

--6. Creating a Stored Procedure with multiple Parameters 
-- Here we can use CREATE or ALTER it is used to both
CREATE OR ALTER PROCEDURE GetEmployees
	@Letter Char='A',
	@Salary Decimal =50000
AS
BEGIN
	SELECT first_name,salary
	FROM Staff.Employees
	WHERE first_name LIKE @Letter+'%' AND salary<@Salary
	ORDER BY salary DESC;
END;

EXECUTE GetEmployees 'G',100000;
EXEC GetEmployees 'B';
EXEC GetEmployees;

--7. Stored Procedure with Output Parameters
CREATE PROC GetEmployeeFullNameById
	@ID INT,
	@FullName Varchar(50) OUTPUT
AS
BEGIN
	SELECT @FullName =  first_name+' '+last_name FROM Staff.Employees
						WHERE id=@ID;
END;




DECLARE @Name VARCHAR(50)
EXEC GetEmployeeFullNameById 1,@Name OUTPUT;
SELECT @Name AS EmployeeName;


