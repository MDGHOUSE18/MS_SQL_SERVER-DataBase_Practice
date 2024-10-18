use constraints;

--Scenario 2: Product Inventory Management
--You are managing an inventory system that tracks products for an online store. In the Products table, 
--you need to apply the following constraints:

--NOT NULL: Each product must have a ProductID, ProductName, and Price.
--UNIQUE: Each product must have a unique ProductCode.
--PRIMARY KEY: The ProductID uniquely identifies each product.
--FOREIGN KEY: Each product must have a SupplierID that references the Suppliers table, ensuring that every product has a valid supplier.
--CHECK: Ensure that the StockQuantity of a product is greater than or equal to 0, and the Price is not negative.
--DEFAULT: If the product's Category is not specified, set it to "General".
--ON DELETE SET NULL: If a supplier is deleted from the Suppliers table, set the SupplierID in the Products table to NULL, 
	--meaning the product no longer has an associated supplier.


CREATE TABLE Suppliers(
	SupplierID INT PRIMARY KEY IDENTITY(101,1),
	Supplier_Name Varchar(25) NOT NULL
);

INSERT INTO Suppliers Values
	('Ghouse'),
	('Lokesh'),
	('Ram Mohan'),
	('Dileep'),
	('Eran');

SELECT * FROM Suppliers;

CREATE TABLE Products(
	ProductID INT PRIMARY KEY NOT NULL,
	ProductName Varchar(50) NOT NULL,
	ProductCode Varchar(50) UNIQUE,
	Category Varchar(50) DEFAULT 'General',
	Price DECIMAL(10,2) NOT NULL CHECK (Price>=0),
	StockQuantity INT CHECK (StockQuantity>=0),
	SupplierID INT,
	FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID)
		ON UPDATE SET NULL
);
DROP TABLE Products;
TRUNCATE TABLE PRODUCTS;

-- Inserting 15 values into the Products table with SupplierID ranging from 101 to 105 in some rows
INSERT INTO Products (ProductID, ProductName, ProductCode, Price, StockQuantity, SupplierID, Category)
VALUES
(1, 'Laptop', 'PRD001', 899.99, 50, 101, 'Electronics'),
(2, 'Smartphone', 'PRD002', 699.99, 100, 102, 'Electronics'),
(3, 'Headphones', 'PRD003', 199.99, 200, 103, 'Accessories'),
(4, 'Monitor', 'PRD004', 249.99, 75, 105, 'Electronics'),
(5, 'Keyboard', 'PRD005', 49.99, 150, 102, 'Accessories'),
(6, 'Mouse', 'PRD006', 29.99, 180, 104, 'Accessories'),
(7, 'Tablet', 'PRD007', 399.99, 60, 103, 'Electronics'),
(8, 'Printer', 'PRD008', 149.99, 40, 101, 'Electronics'),
(9, 'USB Cable', 'PRD009', 9.99, 500, 105, 'Accessories'),
(10, 'Charger', 'PRD010', 19.99, 350, 104, 'Accessories'),
(11, 'External Hard Drive', 'PRD011', 99.99, 120, 102, 'Storage'),
(12, 'Webcam', 'PRD012', 59.99, 85, 103, 'Electronics'),
(13, 'Speakers', 'PRD013', 79.99, 60, 104, 'Audio'),
(14, 'Power Bank', 'PRD014', 39.99, 200, 104, 'Accessories'),
(15, 'Smartwatch', 'PRD015', 249.99, 90, 105, 'Wearables');



SELECT * FROM Products;

UPDATE Products
SET Category = DEFAULT
WHERE ProductID IN(2,5,7,10,12,15);







