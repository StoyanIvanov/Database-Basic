USE Minions
GO

ALTER TABLE Minions
ADD TownId INT,
FOREIGN KEY(TownId) REFERENCES Town(Id);