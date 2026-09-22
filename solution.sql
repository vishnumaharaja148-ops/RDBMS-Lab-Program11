DROP VIEW IF EXISTS StudentDetails;

DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;



CREATE TABLE Student (
    StudentID INT(5) PRIMARY KEY,
    StudentName VARCHAR(20),
    DepartmentID INT(5)
);



CREATE TABLE Course (
    CourseID INT(5) PRIMARY KEY,
    CourseName VARCHAR(30)
);



CREATE TABLE Enrollment (
    EnrollmentID INT(5) PRIMARY KEY,
    StudentID INT(5),
    CourseID INT(5),

    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),

    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);



INSERT INTO Student
VALUES (1001, 'Arun', 101);

INSERT INTO Student
VALUES (1002, 'Divya', 102);

INSERT INTO Student
VALUES (1003, 'Karthik', 101);



INSERT INTO Course
VALUES (201, 'Database Systems');

INSERT INTO Course
VALUES (202, 'Data Structures');

INSERT INTO Course
VALUES (203, 'Mathematics');



INSERT INTO Enrollment
VALUES (1, 1001, 201);

INSERT INTO Enrollment
VALUES (2, 1001, 202);

INSERT INTO Enrollment
VALUES (3, 1002, 203);

INSERT INTO Enrollment
VALUES (4, 1003, 201);



CREATE VIEW StudentDetails AS
SELECT
    s.StudentName,
    c.CourseName,

    CASE
        WHEN s.DepartmentID = 101 THEN 'Computer Science'
        WHEN s.DepartmentID = 102 THEN 'Mathematics'
        ELSE 'Unknown'
    END AS DepartmentName

FROM Student s
JOIN Enrollment e
    ON s.StudentID = e.StudentID
JOIN Course c
    ON e.CourseID = c.CourseID;
    
SELECT * FROM StudentDetails;
