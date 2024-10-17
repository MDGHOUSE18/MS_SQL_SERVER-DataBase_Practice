--Create database name payroll_service
CREATE DATABASE payroll_service;

--Show all databases
SELECT name 
FROM sys.databases;

--Select database
use payroll_service;

--Create Table
Create Table employee_payroll(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50),
	Salary INT,
	Start_Date DATE
	);


--Add data into table
INSERT INTO employee_payroll(Name,Salary,Start_Date)
VALUES('Ghouse',25000,'2024-10-01'),
	('Ikram',32000,'2024-08-01'),
	('Asad',22000,'2024-09-10'),
	('Aiza',37000,'2024-09-15'),
	('Ali',30000,'2024-07-16'),
	('Arifa',27000,'2024-10-10'),
	('Ayesha',33000,'2024-10-06'),
	('Bilal',28000,'2024-09-30');

--Retrive all data
SELECT * from employee_payroll;

--Delete all rows from table
TRUNCATE TABLE employee_payroll;

--Query for Mahammed Salary
SELECT salary from employee_payroll
	where Name='Ghouse';

--Select employees between start dates
Select * from employee_payroll
	where Start_Date BETWEEN CAST('2024-09-01' AS DATE) AND CAST(GETDATE() AS DATE);

--Alter the table
ALTER TABLE employee_payroll
	Add gender varchar(5);

--Add All genders to mail
UPDATE employee_payroll 
	set gender='M'
	where gender IS NULL;

--Update the gender
UPDATE employee_payroll 
	set gender='F'
	where Name='Arifa' OR Name='Aiza';
UPDATE employee_payroll 
	set gender='F'
	where Name='Ayesha';
