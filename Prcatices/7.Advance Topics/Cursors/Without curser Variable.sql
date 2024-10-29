use EmployeeManagementSystem;

SELECT * FROM Staff.Employees;

--In SQL Server, a cursor is a database object that allows row-by-row processing of query results. 
--Cursors are helpful for operations where we need to process individual rows one at a time rather than all at once. 

-- Step 1: Declare the cursor
DECLARE emp_data CURSOR scroll FOR
SELECT * FROM Staff.Employees;

-- Step 2: Open the cursor
OPEN emp_data;

-- Step 3: Fetching rows from table using cursors
--FETCH FIRST : Retrieves the first row in the result set.
FETCH FIRST FROM emp_data;
--FETCH NEXT : Retrieves the next row in the result set.
FETCH NEXT FROM emp_data;
--FETCH LAST : Retrieves the last row in the result set.
FETCH LAST FROM emp_data;
--FETCH PRIOR : Retrieves the previous row in the result set.
FETCH PRIOR FROM emp_data;
--FETCH ABSOLUTE : Retrieves the row at a specified position.
FETCH ABSOLUTE 4 FROM emp_data;
--FETCH RELATIVE : Retrieves a row relative to the current position.
FETCH RELATIVE -3 FROM emp_data;
FETCH RELATIVE 6 FROM emp_data;

-- Step 5: Close the cursor
CLOSE emp_data;

-- Step 6: Deallocate the cursor
DEALLOCATE emp_data;




-- Declare variables to hold employee ID and email
DECLARE @empID INT, @email VARCHAR(50);

-- Declare a scrollable cursor named emp_data for selecting id and email from the Employees table
DECLARE emp_data CURSOR SCROLL FOR 
SELECT id, email FROM Staff.Employees;

-- Open the cursor to begin fetching data
OPEN emp_data;

-- Fetch the first row from the cursor into the declared variables
FETCH FIRST FROM emp_data INTO @empID, @email;

-- Loop through the cursor while there are more rows to fetch
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print the employee ID and email to the output
    PRINT CAST(@empID AS VARCHAR) + ' ' + @email;

    -- Fetch the next row from the cursor into the declared variables
    FETCH NEXT FROM emp_data INTO @empID, @email;
END

-- Close the cursor to release the locks and resources
CLOSE emp_data;

-- Deallocate the cursor to free up system resources
DEALLOCATE emp_data;  
 

