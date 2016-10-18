--Your task is to create a stored procedure usp_GetHoldersWithBalanceHigherThan that accepts a number as a parameter
-- and returns all people who have more money in total of all their accounts than the supplied number. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
Use BankAccounts
GO


CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan
@NUMBER DECIMAL(38,20)
AS
BEGIN
SELECT FIRSTNAME AS [First Name], LASTNAME as [Last Name]
FROM AccountHolders AH
LEFT JOIN Accounts ACC ON AH.ID = ACC.AccountHolderId 
GROUP BY FIRSTNAME, LASTNAME
HAVING SUM(ACC.BALANCE) > @NUMBER
END

EXEC usp_GetHoldersWithBalanceHigherThan @money=1000

CREATE DATABASE BankAccounts
GO

CREATE TABLE AccountHolders(
ID INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
SSN VARCHAR(10) NOT NULL
);
GO

CREATE TABLE Accounts(
ID INT PRIMARY KEY IDENTITY(1,1),
AccountHolderID INT NOT NULL,
CONSTRAINT fk_AccountHolder_Account FOREIGN KEY(AccountHolderID)
REFERENCES AccountHolders(ID),
Balance MONEY NOT NULL
);
GO

INSERT INTO AccountHolders(FirstName, LastName, SSN)
VALUES
('Pesho', 'Istatkov','12123'),
('Ivan', 'Petrov','12312'),
('Georgi', 'Manov','123123'),
('Miro', 'Kirov','123123'),
('Scveti', 'Mircheva','123123')

INSERT INTO Accounts(AccountHolderID, Balance)
VALUES
(6,5),
(2,15),
(2,50),
(4,2),
(6,25),
(4,55),
(5,1555),
(5,58),
(5,56),
(5,5),
(2,25),
(3,51),
(6,5),
(6,5)