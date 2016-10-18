--Add stored procedures usp_WithdrawMoney (AccountId, moneyAmount) that operate in transactions. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE BankAccounts
GO

CREATE PROCEDURE usp_WithdrawMoney (@AccountId INT, @moneyAmount FLOAT)
AS
BEGIN
	BEGIN TRAN

	UPDATE Accounts
	SET Balance = Balance - @moneyAmount
	WHERE ID = @AccountId

	IF (@moneyAmount <= 0)
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END