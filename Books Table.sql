--Write an SQL query to insert a new book into the Books table with the following details:
--Title: "C# Programming"
--Author: "John Doe"
--ISBN: "123-456-7890"
--Price: 29.99
--Genre: "Programming"
--Write an SQL query to retrieve books from the Books table where the Genre is "Programming".
--Write an SQL query to update the price of the book with BookID = 1 to 35.99.
--Write an SQL query to delete the book with the ISBN = '123-456-7890' from the Books table.

Create Database Review;

use Review;

Create Table Books(
	BookID int IDENTITY(1,1),
	Title Varchar(25),
	Author Varchar(25),
	ISBN Varchar(25),
	Price decimal,
	Genre Varchar(24));

--DROP TABLE BOOKS;
INSERT INTO Books(Title,Author,ISBN,Price,Genre)
	VALUES('C# Programming','John Deo','123-456-7890',29.99,'Programming'),
	('Java Programming','Gosling','123-456-5890',24.99,'Programming'),
	('Python','Guido','123-656-7890',39.99,'Programming');

Select * from Books;

Select * from Books where Title='Python';

Update Books 
  set Price=35.99 where BookID=1;


Delete from Books where ISBN = '123-456-7890';