USE Minions
GO

CREATE TABLE Users
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,2),
Username VARCHAR(30) NOT NULL UNIQUE,
Password VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(900),
LastLoginTime DATE,
IsDeleted VARCHAR(5) DEFAULT('False')
CONSTRAINT chk_IsDeleted CHECK(IsDeleted IN ('True','False')) NOT NULL,
);

INSERT Users (Username, password)
VALUES 
('Pesho', '1234'),
('Rado', '2345'),
('Valdo', '3456'),
('Gego', '4567'),
('Marto', '5678')