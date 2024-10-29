--Scenario 1: Creating and Managing a Database
--1.Task: Create a database named SchoolDB.
--	Hint: Use the CREATE DATABASE command.

CREATE DATABASE SchoolDB;

--2.Task: Drop the database named SchoolDB.
--	Hint: Use the DROP DATABASE command.

DROP DATABASE SchoolDB;

use SchoolDB;

--Scenario 2: Working with Schemas
--1.Task: Create a schema named Academics in the SchoolDB database.
	--Hint: Use the CREATE SCHEMA command.	

CREATE SCHEMA Academics;

--2.Task: Create a table Courses in the Academics schema with the following columns:
	--CourseID (integer, primary key)
	--CourseName (variable-length string, max 100 characters, not null)
	--Credits (integer, default value 3)
	--Hint: Use the CREATE TABLE command.

CREATE TABLE Academics.Courses(
	CourseID int primary key,
	CourseName varchar(100) Not Null,
	Credits int Default 3
);



--3.Task: Move the Courses table from the Academics schema to a new schema named Departments.
	--Hint: Use the ALTER SCHEMA command.

CREATE SCHEMA Departments;

ALTER SCHEMA Departments TRANSFER Academics.Courses;

--4.Task: Drop the Departments schema after transferring any securables out of it.
	--Hint: Use the DROP SCHEMA command.

-- Step 5: Create the dbo schema if it does not exist
--CREATE SCHEMA dbo;

-- Step 6: Transfer the Courses table back to the dbo schema
ALTER SCHEMA dbo TRANSFER Departments.Courses;

DROP SCHEMA Departments;

