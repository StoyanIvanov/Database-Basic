--Your task is to create a function ufn_CalculateFutureValue that accepts as parameters – sum, 
--yearly interest rate and number of years. It should calculate and return the future value of the initial sum. 
--Using the following formula:
--FV=I×(〖(1+R)〗^T)
--	I – Initial sum
--	R – Yearly interest rate
--	T – Number of years
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 55) AS s

CREATE FUNCTION ufn_CalculateFutureValue(@sum INT, @rate FLOAT, @years INT)
RETURNS DECIMAL(10,4)
BEGIN
	IF(@rate<100 AND @sum > 0 AND @years > 0)
	BEGIN
		 DECLARE @futureValue DECIMAL(10,4) = @sum * (POWER(1+@rate,@years));
	END
 RETURN @futureValue;
END;