USE Minions
GO

CREATE TABLE People
(
Id INT NOT NULL IDENTITY(1,2) PRIMARY KEY,
Name varchar(200) NOT NULL,
Picture image NULL,
Height float(2),
Weight float(2),
Gender varchar(1)
CONSTRAINT chk_Gender CHECK(Gender IN ('F','M')) NOT NULL,
BurthDay date NOT NULL,
Biography nvarchar(max)
);

INSERT People (Name, Height, Weight, Gender, BurthDay)
VALUES ('Pesho', 1.86, 75, 'F', GETDATE()), 
('Ivan', 1.86, 75, 'F', GETDATE()),
('Georgi', 1.86, 75, 'F', GETDATE()),
('Miro', 1.86, 75, 'F', GETDATE()),
('Stamo', 1.86, 75, 'F', GETDATE())