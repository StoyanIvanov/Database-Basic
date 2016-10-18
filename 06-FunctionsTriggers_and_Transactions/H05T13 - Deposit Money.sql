--Add stored procedure usp_DepositMoney (AccountId, moneyAmount) that operate in transactions. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
Use BankAccounts
GO

CREATE PROCEDURE usp_DepositMoney (@AccountId INT, @moneyAmount FLOAT)
AS
BEGIN
	BEGIN TRAN
	UPDATE Accounts
	SET Balance = Balance + @moneyAmount
	WHERE Accounts.ID = @AccountId

	IF(@moneyAmount <= 0 AND (SELECT COUNT(ID) FROM Accounts WHERE Accounts.ID=@AccountId)<=0 )
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END
	