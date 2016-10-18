CREATE DATABASE University

USE University
GO

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL
);

CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY IDENTITY(1,1),
SubjectName VARCHAR(255) NOT NULL
);

CREATE TABLE Students
(
StudentID INT PRIMARY KEY IDENTITY(1,1),
StudentNumber INT NOT NULL,
StudentName VARCHAR(50) NOT NULL,
MajorID INT NOT NULL,
CONSTRAINT FK_StudentsMajors FOREIGN KEY (MajorID)
REFERENCES Majors(MajorID)
);

CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY IDENTITY(1,1),
PaymentDate Date NOT NULL,
PaymentAmount FLOAT(2) NOT NULL,
StudentID INT NOT NULL,
CONSTRAINT FK_PaymentsStudents FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)
);

CREATE TABLE Agenda
(
StudentID INT NOT NULL,
SubjectID INT NOT NULL,
CONSTRAINT PK_StudentSubject PRIMARY KEY (StudentID, SubjectID),
CONSTRAINT FK_AgendaStudents FOREIGN KEY (StudentID)
REFERENCES Students(StudentID),
CONSTRAINT FK_AgendaSubjects FOREIGN KEY (SubjectID)
REFERENCES Subjects(SubjectID)
);