--In SQL Server, a trigger is a special type of stored procedure that automatically executes in response to certain events on a table or view. 
--Triggers are often used to maintain 
	--data integrity, 
	--enforce business rules, 
	--and automate tasks within the database.4

--Creating a Trigger

--CREATE TRIGGER trigger_name
--ON table_name
--AFTER INSERT | UPDATE | DELETE
--AS
--BEGIN
--    -- Trigger logic here
--END;


SELECT * FROM Students;

CREATE TABLE Student_audit(
	id INT PRIMARY KEY IDENTITY(1,1),
	student_id INT NOT NULL,
	updated_at DATETIME NOT NULL DEFAULT GETDATE(),
    operation CHAR(3) NOT NULL,
    CHECK (operation IN ('INS','UPD','DEL'))
);

CREATE OR ALTER TRIGGER InsertStudent
ON Students
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @id int 
	SELECT @id = id from inserted;

	INSERT INTO Student_audit(student_id, operation)
	VALUES(@id,'INS');
	PRINT 'Student Added Sucessfully!';
END;

INSERT INTO Students (Name, DOB, PhoneNumber, EnrollmentDate) VALUES
('Oggy', '1998-07-15', '185-567-7701', GETDATE()),
('Bheem', '2002-02-19', '185-467-7701', GETDATE());

INSERT INTO Students (Name, DOB, PhoneNumber, EnrollmentDate) VALUES
('Ben', '1999-04-10', '185-567-7701', GETDATE());

INSERT INTO Students (Name, DOB, PhoneNumber, EnrollmentDate) VALUES
('Dhoni', '1999-01-29', '185-467-7701', GETDATE());

SELECT * from Student_audit;

CREATE OR ALTER TRIGGER Updatetudent
ON Students
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @id int 
	SELECT @id = id from inserted;

	INSERT INTO Student_audit(student_id, operation)
	VALUES(@id,'UPD');
	PRINT 'Student Update succesfully';
END;

UPDATE Students
SET Name='Ben Stokes'
Where Id=26;

CREATE OR ALTER TRIGGER Deletestudent
ON Students
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @id int 
	SELECT @id = id from deleted;

	INSERT INTO Student_audit(student_id, operation)
	VALUES(@id,'DEL');
	PRINT 'Student Delete succesfully';
END;

DELETE FROM Students
WHERE Name = 'Bheem';

sp_helptext Deletestudent;
