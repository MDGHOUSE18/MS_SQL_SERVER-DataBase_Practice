use EmployeeManagementSystem;

SELECT * FROM Staff.Employees;

DECLARE @empID INT, @email NVARCHAR(50),@jobtitle NVARCHAR(50);

-- Step 1: Declare the cursor
DECLARE @emp_data CURSOR;
SET @emp_data =  CURSOR FOR SELECT id,email,job_title FROM Staff.Employees;

-- Step 2: Open the cursor
OPEN @emp_data;

-- Step 3: Fetch the first row
FETCH NEXT FROM @emp_data INTO @empID, @email,@jobtitle;

 --Step 4: Process each row
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Id: ' + CAST(@empID AS NVARCHAR) + ', Email: ' + @email+ ', Domain: ' + @jobtitle
    
    -- Fetch the next row
    FETCH NEXT FROM @emp_data INTO @empID, @email,@jobtitle;
END

-- Step 5: Close the cursor
CLOSE @emp_data;

-- Step 6: Deallocate the cursor
DEALLOCATE @emp_data;

