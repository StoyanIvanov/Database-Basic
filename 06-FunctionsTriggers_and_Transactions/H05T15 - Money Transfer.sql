--Write stored procedure that transfers money from one account to another. 
--Consider cases when one of the AccountIds is not valid or the amount of money is negative number. 
--Make sure that the whole procedure passes without errors and if error occurs make no change in the database.
USE BankAccounts
GO

CREATE PROCEDURE usp_AccountsTransfer (@money FLOAT, @fromAccountID INT, @toAccountID INT)
AS
BEGIN
	BEGIN TRAN

	UPDATE Accounts
	SET Balance = Balance - @money
	WHERE ID = @fromAccountID
	UPDATE Accounts
	SET Balance = Balance + @money
	WHERE ID = @toAccountID

	IF ((SELECT Balance FROM Accounts WHERE ID = @fromAccountID) < 0 
		OR @money <= 0 
		OR (SELECT COUNT(ID) FROM Accounts WHERE ID = @fromAccountID)<=0 
		OR (SELECT COUNT(ID) FROM Accounts WHERE ID = @toAccountID)<=0)
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END