USE TableRelations
GO

CREATE TABLE Students
(
StudentID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(100) NOT NULL
);

INSERT Students(Name)
VALUES ('Mila'), ('Toni'),('Ron')

CREATE TABLE Exams
(
ExamID INT PRIMARY KEY IDENTITY(101,1),
Name NVARCHAR(50) NOT NULL
);

INSERT Exams(Name)
VALUES ('Spring MVC'), ('Neo4j'), ('Oracle 11g')

CREATE TABLE StudentsExams
(
StudentID INT NOT NULL,
ExamID INT NOT NULL,
CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID, ExamID),
CONSTRAINT FK_Student_Student FOREIGN KEY(StudentID)
REFERENCES Students(StudentID),
CONSTRAINT FK_Examp_Examp 
FOREIGN KEY(ExamID)
REFERENCES Exams(ExamID)
);

INSERT StudentsExams(StudentID, ExamID)
VALUES (1,101),(1,102),(2,101),(3,103),(2,102),(2,103)