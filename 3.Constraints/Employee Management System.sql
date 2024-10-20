--Scenario 1: Employee Management System
--Imagine you're building a table to store employee information for a company. You need to ensure that the following constraints are applied:
--1.NOT NULL: Employees must have an EmployeeID, FirstName, and LastName. These fields should never be empty.
--2.UNIQUE: Each employee must have a unique Email, and the EmployeeID must also be unique across all employees.
--3.PRIMARY KEY: The EmployeeID uniquely identifies each employee.
--4.FOREIGN KEY: Each employee belongs to a Department. The DepartmentID in the Employee table must reference the DepartmentID from a Departments table to ensure the department exists.
--5.CHECK: Ensure that the employee's Age is at least 18 and their Salary is not negative.
--6.DEFAULT: If an employee doesn't provide a Country, assume the employee is from "USA".
--7.ON DELETE CASCADE: If a department is deleted from the Departments table, automatically delete all employees in that department.

Create Database constraints;

use constraints;	

--Step 1: Create the Departments Table (Referenced by Employee Table)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

--Step 2: Insert Sample Data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

SELECT * FROM Departments;

--Step 3: Create the Employees Table with All Constraints
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,  -- PRIMARY KEY constraint
    FirstName VARCHAR(50) NOT NULL,  -- NOT NULL constraint
    LastName VARCHAR(50) NOT NULL,  -- NOT NULL constraint
    Email VARCHAR(100) UNIQUE,  -- UNIQUE constraint
    Age INT CHECK (Age >= 18),  -- CHECK constraint (Age >= 18)
    Salary DECIMAL(10,2) CHECK (Salary >= 0),  -- CHECK constraint (Salary >= 0)
    DepartmentID INT,  -- Foreign Key referencing Departments table
    Country VARCHAR(50) DEFAULT 'USA',  -- DEFAULT constraint
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)  -- FOREIGN KEY constraint
        ON DELETE CASCADE  -- Cascade delete action when a department is deleted
);

--Step 4: Insert Sample Data into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Age, Salary, DepartmentID, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 25, 55000.00, 2, 'USA'),  
(2, 'Jane', 'Smith', 'jane.smith@example.com', 30, 60000.00, 1, 'Canada'),  
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 22, 45000.00, 3, 'UK'),  
(4, 'Bob', 'Brown', 'bob.brown@example.com', 28, 52000.00, 1, 'USA');  


--Step 5: View Inserted Data
SELECT * FROM Employees;
