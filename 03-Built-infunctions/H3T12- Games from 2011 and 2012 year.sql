--Find the top 50 games ordered by start date, then by name of the game. 
--Display only games from 2011 and 2012 year. Display start date in the format “YYYY-MM-DD”. 
--Submit your query statements as Prepare DB & run queries.
USE Diablo
GO

SELECT TOP 50 g.Name AS Game, SUBSTRING(CONVERT(VARCHAR(30), g.Start, 20),1,10) AS Start FROM Games AS g
WHERE YEAR(g.Start) BETWEEN 2011 AND 2012
ORDER BY g.Start, g.Name