--Create a function ufn_CashInUsersGames that returns the sum of the cash on odd rows ordered by cash in descending order. 
--The function should take a game name as a parameter and return the result as table. 
--Submit only your function in judge as Run skeleton, run queries & check DB.
--Execute the function over the following game names, ordered exactly like: 
--“Bali”, “Lily Stargazer”, “Love in a mist”, “Mimosa”, “Ming fern”.
USE Diablo
GO

CREATE FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
RETURNS @returnTable TABLE
(
SumCash MONEY
)
BEGIN
DECLARE @result MONEY = (
SELECT SUM(res.cash) AS SumCash FROM (
SELECT ug.Id, ug.Cash, ROW_NUMBER() OVER(ORDER BY ug.Id DESC) Row FROM UsersGames AS ug
INNER JOIN Games As g
ON g.id = ug.GameId
WHERE g.Name = @gameName
) AS res
WHERE res.Row % 2 = 0)

IF(@result>0)
BEGIN
	INSERT INTO @returnTable
	VALUES (@result)
END
ELSE
BEGIN
	INSERT INTO @returnTable
	VALUES (0)
END

RETURN
END

SELECT * FROM ufn_CashInUsersGames('Love in a mist')