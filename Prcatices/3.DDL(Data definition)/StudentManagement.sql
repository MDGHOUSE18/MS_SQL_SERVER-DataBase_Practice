use SchoolDB;

CREATE TABLE Students(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name Varchar(20) NOT NULL,
	DOB DATE NOT NULL,
	PhoneNumber  NVARCHAR(15),
	EnrollmentDate DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    CourseDescription NVARCHAR(255),
    Credits INT NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (StudentID) REFERENCES Students(Id),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentID INT NOT NULL,
    Grade NVARCHAR(2) NOT NULL,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

-- Insert 20 Students into the Students Table
INSERT INTO Students (Name, DOB, PhoneNumber, EnrollmentDate) VALUES
('John Doe', '2000-01-15', '123-456-7890', GETDATE()),
('Jane Smith', '1999-02-20', '234-567-8901', GETDATE()),
('Emily Johnson', '2001-03-25', '345-678-9012', GETDATE()),
('Michael Brown', '1998-04-30', '456-789-0123', GETDATE()),
('Sarah Davis', '2000-05-10', '567-890-1234', GETDATE()),
('David Wilson', '1997-06-15', '678-901-2345', GETDATE()),
('Emma Moore', '2002-07-20', '789-012-3456', GETDATE()),
('James Taylor', '1999-08-25', '890-123-4567', GETDATE()),
('Olivia Anderson', '2001-09-30', '901-234-5678', GETDATE()),
('William Thomas', '2000-10-05', '012-345-6789', GETDATE()),
('Sophia Jackson', '1998-11-12', '123-456-7891', GETDATE()),
('Benjamin White', '2002-12-18', '234-567-8902', GETDATE()),
('Isabella Harris', '2001-01-22', '345-678-9013', GETDATE()),
('Mason Martin', '1999-02-28', '456-789-0124', GETDATE()),
('Ava Thompson', '2000-03-15', '567-890-1235', GETDATE()),
('Liam Garcia', '1997-04-20', '678-901-2346', GETDATE()),
('Mia Martinez', '2002-05-25', '789-012-3457', GETDATE()),
('Noah Robinson', '2001-06-30', '890-123-4568', GETDATE()),
('Charlotte Clark', '1999-07-12', '901-234-5679', GETDATE()),
('Elijah Lewis', '2000-08-17', '012-345-6780', GETDATE());

-- Optional: Insert Sample Courses
INSERT INTO Courses (CourseName, CourseDescription, Credits) VALUES
('Mathematics', 'Fundamentals of Mathematics', 3),
('Physics', 'Introduction to Physics', 4),
('Chemistry', 'Basics of Chemistry', 3),
('Biology', 'Principles of Biology', 3),
('Computer Science', 'Introduction to Programming', 4);

-- Optional: Enroll Students in Courses
-- Assuming courses with IDs 1 to 5 are inserted above
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(4, 1),
(5, 5),
(6, 3),
(7, 2),
(8, 1),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);




SELECT * FROM Students