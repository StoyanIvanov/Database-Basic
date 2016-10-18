--Find all games with part of the day and duration sorted by game name alphabetically then by duration and part of the day. 
--Parts of the day should be Morning (time is >= 0 and < 12), Afternoon (time is >= 12 and < 18), Evening (time is >= 18 and < 24). 
--Duration should be Extra Short (smaller or equal to 3), Short (between 4 and 6 including), Long (greater than 6) and Extra Long (without duration). 
--Submit your query statements as Prepare DB & run queries.
USE Diablo
GO

SELECT g.Name AS 'Game', 
			   CASE
				  WHEN DATENAME(hour, CONVERT(NVARCHAR(10),g.Start,108)) BETWEEN 0 AND 11 THEN 'Morning'
				  WHEN DATENAME(hour, CONVERT(NVARCHAR(10),g.Start,108)) BETWEEN 12 AND 17 THEN 'Afternoon'
				  ELSE 'Evening'
			   END AS 'Part of the Day',
			   CASE
			      WHEN g.Duration <=3 THEN 'Extra Short'
				  WHEN g.Duration BETWEEN 4 AND 6 THEN 'Short'
				  WHEN g.Duration IS NULL THEN 'Extra Long'
				  ELSE 'Long'
			   END AS 'Duration'
 FROM Games as g
 ORDER BY g.Name, [Duration], [Part of the Day]