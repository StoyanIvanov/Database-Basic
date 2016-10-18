USE TableRelations
GO

Create Table Managers
(
ManagerID INT PRIMARY KEY IDENTITY(101,1),
Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Teachers
(
TeacherID INT PRIMARY KEY,
Name NVARCHAR(100) NOT NULL,
ManagerID INT,
CONSTRAINT FK_TeacherManager FOREIGN KEY (ManagerID)
REFERENCES Managers(ManagerID) ON DELETE CASCADE
);

INSERT Managers(Name)
VALUES ('BashMaistora'), ('IvanKirkata'), ('StamatFasa'), ('KirilPandistchiata'), ('Stamat'), ('Murf');

INSERT Teachers(TeacherID, Name, ManagerID)
VALUES (101, 'John', NULL),(102, 'Maya', 106), (103, 'Silvia', 106), (104, 'Ted', 105), (105, 'Mark', 101), (106, 'Greta', 101);