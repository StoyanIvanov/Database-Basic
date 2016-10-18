--Write a query that selects:
--	CountryCode
--	MountainRanges
--Filter the count of the mountain ranges in the USA, Russia and Bulgaria.
USE Geography
GO

SELECT c.CountryCode, COUNT(m.MountainRange) AS MountainRanges FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
WHERE c.CountryCode='US' OR c.CountryCode='RU' OR c.CountryCode='BG'
GROUP BY c.CountryCode
