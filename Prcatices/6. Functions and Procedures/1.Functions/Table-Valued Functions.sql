use ECommercePlatform

SELECT * FROM UserManagement.Users;

--2. Table-Valued Functions
--Table-valued functions return a table as the result. They can be further classified into Inline and Multi-Statement table-valued functions.

-- => these functions returns records
-- => return type of these functions must be TABLE
-- => return expression must be select statement
-- => table valued functions allows only one statement and that statement must be return statement
-- => table valued functions are invoked in FROM clause

--1) Inline Table-Valued Function
--Inline functions are similar to views and consist of a single RETURN statement.

--CREATE FUNCTION function_name (@parameter_name datatype, ...)
--RETURNS TABLE
--AS
--RETURN
--(
--    SELECT ... -- Query returning a table
--);

--Example: A function to return employees in a specific department:

CREATE OR ALTER FUNCTION GetEmployessByDepartment(@roleId INT)
RETURNS TABLE
AS
RETURN SELECT first_name,last_name,email,role_name
		FROM UserManagement.Users u
		INNER JOIN UserManagement.Profiles p ON u.profile_id=p.profile_id
		INNER JOIN UserManagement.Roles r ON u.role_id=r.role_id
		WHERE u.role_id=@roleId;

SELECT DISTINCT * FROM dbo.GetEmployessByDepartment(10)
ORDER BY first_name;


--2) Multi-Statement Table-Valued Function
--Multi-statement table-valued functions allow you to perform multiple operations before returning the final table.

--CREATE FUNCTION function_name (@parameter_name datatype, ...)
--RETURNS @table_variable TABLE (column1 datatype, column2 datatype, ...)
--AS
--BEGIN
--    -- Populate @table_variable with data
--    INSERT INTO @table_variable
--    SELECT ...

--    RETURN;
--END;

use EmployeeManagementSystem;
SELECT * FROM STAFF.EMPLOYEES
ORDER BY job_title;

CREATE OR ALTER FUNCTION Staff.GetEmployeesByDept(@dep varchar(50))
RETURNS @EmpByDept TABLE (Name varchar(50),Email varchar(50),Gender varchar(50),Salary Decimal(10,2))
AS
BEGIN
	INSERT INTO @EmpByDept
	SELECT (first_name+' '+last_name) name,email,gender,salary
	FROM Staff.Employees
	Where job_title=@dep;

	RETURN;
END;

SELECT * FROM Staff.GetEmployeesByDept('General Manager');

SELECT * FROM Staff.GetEmployeesByDept('Assistant Professor');
