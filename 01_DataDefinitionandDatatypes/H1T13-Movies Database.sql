--Using SQL queries create Movies database with the following entities:
--Directors (Id, DirectorName, Notes)
--Genres (Id, GenreName, Notes)
--Categories (Id, CategoryName, Notes)
--Movies (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--Set most appropriate data types for each column. Set primary key to each table. 
--Populate each table with 5 records. Make sure the columns that are present in 2 tables would be of the same data type. 
--Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
CREATE DATABASE Movies
GO

USE Movies
GO

CREATE TABLE Directors
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
DirectorName VARCHAR(50) NOT NULL
CONSTRAINT chk_DirectorName_lenght CHECK(DATALENGTH(DirectorName)<51),
Notes VARCHAR(255)
CONSTRAINT chk_DirectorsNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

CREATE TABLE Genres
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
GenreName VARCHAR(30) NOT NULL
CONSTRAINT chk_GenreName_lenght CHECK(DATALENGTH(GenreName)<30),
Notes VARCHAR(255)
CONSTRAINT chk_GenresNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

CREATE TABLE Categories
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CategoryName VARCHAR(50) NOT NULL
CONSTRAINT chk_CategoryName_lenght CHECK(DATALENGTH(CategoryName)<51),
Notes VARCHAR(255)
CONSTRAINT chk_CategoriesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

CREATE TABLE Movies
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Title VARCHAR(100) NOT NULL
CONSTRAINT chk_Title_lenght CHECK(DATALENGTH(Title)<101),
DirectorID INT NOT NULL REFERENCES Directors(Id),
CopyrightYear DATE,
Length FLOAT(2),
GenreID INT NOT NULL REFERENCES Genres(Id),
CategoryID INT NOT NULL REFERENCES Categories(Id),
Rating INT,
Notes VARCHAR(255)
CONSTRAINT chk_MoviesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Directors (DirectorName)
VALUES 
('Pesho'),
('Rado'),
('Valdo'),
('Gego'),
('Marto')

INSERT Genres (GenreName)
VALUES 
('Horror'),
('Trillar'),
('Other'),
('Commedy'),
('Action')

INSERT Categories (CategoryName)
VALUES 
('Category1'),
('Category2'),
('Category3'),
('Category4'),
('Category5')

INSERT Movies (Title,DirectorID, GenreID, CategoryID)
VALUES 
('Movie1',1,1,1),
('Movie2',2,2,2),
('Movie3',3,3,3),
('Movie4',4,4,4),
('Movie5',5,5,5)