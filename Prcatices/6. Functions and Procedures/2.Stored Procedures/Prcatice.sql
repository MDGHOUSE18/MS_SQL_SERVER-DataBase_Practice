use AssignmentDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Email VARCHAR(100)
);


INSERT INTO Customers ( FirstName, LastName, DOB, Email) VALUES
('Alice', 'Smith', '2000-05-12', 'alice.smith@example.com'),
('Bob', 'Johnson', '2005-11-25', 'bob.johnson@example.com'),
('Charlie', 'Williams', '1995-02-14', 'charlie.williams@example.com'),
('Diana', 'Brown', '1998-09-08', 'diana.brown@example.com'),
('Eve', 'Davis', '2003-07-21', 'eve.davis@example.com');

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(10, 2),
    CustomerID INT,
    PaymentDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Payments(Amount, CustomerID, PaymentDate) VALUES
(120.50, 1, '2024-01-10'),
(75.00, 2, '2024-01-15'),
(200.00, 3, '2024-02-20'),
(150.75, 4, '2024-02-25'),
(45.25, 5, '2024-03-01'),
(99.99, 1, '2024-03-15'),
(105.00, 2, '2024-04-10'),
(220.50, 3, '2024-04-20'),
(88.00, 4, '2024-05-05'),
(130.25, 5, '2024-05-15');

--1)Problem: Write a stored procedure that inserts a new customer, but only if the customer is 18 years or older. 
--If the customer is younger than 18, return an error message.
--Sample Inputs: FirstName, LastName, DOB
SELECT * FROM Customers;

CREATE OR ALTER PROCEDURE AddCustomers
@FirstName varchar(50),
@LastName varchar(50),
@DOB DATE,
@Email varchar(50)
AS
BEGIN
	DECLARE @Age INT;
	SET @Age = DateDiff(yy,@DOB,GETDATE());

	IF DATEADD(YEAR, @Age, @DOB) > GETDATE()
        SET @Age = @Age - 1;

	IF @Age >=18
	BEGIN
		INSERT INTO Customers(FirstName,LastName,DOB,Email)
		Values(@FirstName,@LastName,@DOB,@Email);
		PRINT 'Customer added sucessfully';
	END;
	ELSE
	BEGIN
		THROW 50000, 'Customer must be 18 years or older.', 1;
	END
END;

EXEC AddCustomers 'Junaid','Ahamed','2001-09-20','junaid1223@gmail.com';
EXEC AddCustomers 'Fuzail','Ahamed','2001-09-20','fuzail145@gmail.com';
EXEC AddCustomers 'Mahammed','Yousf','2001-09-20','mdyousuf1@gmail.com';

--2) Problem: Write a stored procedure that applies a discount to a payment if the payment amount is greater than $100. 
--If the payment is below or equal to $100, process the payment without a discount.
--Sample Inputs: PaymentID, Amount
SELECT * FROM Payments;

CREATE OR ALTER PROCEDURE GiveDiscounts
@PaymentID INT,
@Amount DECIMAL(10,2)
AS
BEGIN
	DECLARE @DiscountAmount DECIMAL(10,2);
	IF @Amount>100
	BEGIN
        SET @DiscountAmount=@Amount*(0.9)
	END
	ELSE
	BEGIN
		SET @DiscountAmount=@Amount
	END
	UPDATE Payments
	SET Amount=@DiscountAmount
	Where PaymentID=@PaymentID
END;

EXEC GiveDiscounts 3,200;
--3) Problem: Write a stored procedure to insert a new customer, but first check if the email already exists. 
--If the email exists, return an error message; otherwise, insert the customer.
--Sample Inputs: FirstName, LastName, Email


CREATE OR ALTER PROCEDURE AddCustomer
@FirstName varchar(50),
@LastName varchar(50),
@DOB DATE,
@Email varchar(50)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Customers WHERE email=@Email)
	BEGIN
		THROW 50000, 'Email already exists', 1;
	END;
	ELSE
	BEGIN		
		INSERT INTO Customers(FirstName,LastName,DOB,Email)
		Values(@FirstName,@LastName,@DOB,@Email);
        SELECT 'Customer added successfully' AS Message;
	END
END;


EXEC AddCustomers 'Fuzail','Ahamed','2001-09-20','fuzail145@gmail.com';
EXEC AddCustomers 'Mahammed','Yousf','2001-09-20','mdyousuf1@gmail.com';






