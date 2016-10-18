--Create another table – Logs (LogId, AccountId, OldSum, NewSum). 
--Add a trigger to the Accounts table that enters a new entry into the Logs table every time the sum on an account changes.
USE BankAccounts
GO

CREATE TABLE Logs(
ID INT PRIMARY KEY IDENTITY(1,1),
AccountID INT NOT NULL
CONSTRAINT fk_Log_Account FOREIGN KEY(ID)
REFERENCES Accounts(ID),
OldSum FLOAT NOT NULL,
NewSum FLOAT NOT NULL
)

CREATE TRIGGER Logs
ON Accounts.Balance
AFTER Update
AS
BEGIN
	INSERT Logs(OldSum, AccountID, NewSum)
	SET OldSum = Balance, AccountID = ID, NewSum
	FROM inserted
END
	