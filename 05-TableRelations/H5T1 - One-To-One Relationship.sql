USE TableRelations
GO

CREATE TABLE Passports
(
PassportID INT PRIMARY KEY,
PassportNumber VARCHAR(10) NOT NULL
);

INSERT Passports(PassportID,PassportNumber)
VALUES (101,'N34FG21B'), (102, 'K65LO4R7'), (103, 'ZE657QP2')

CREATE TABLE Persons
(
PersonID INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
Salary FLOAT NOT NULL,
PassportID INT UNIQUE NOT NULL,
CONSTRAINT FK_Person_Passport 
FOREIGN KEY(PassportID)
REFERENCES Passports(PassportID)
)

INSERT Persons(FirstName, Salary, PassportID)
VALUES ('Roberto',43300.00,102),('Tom',56100.00,103),('Yana',60200.00,101)