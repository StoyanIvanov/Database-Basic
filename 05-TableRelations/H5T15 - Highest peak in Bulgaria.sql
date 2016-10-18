--Write a query that selects:
--	CountryCode
--	MountainRange
--	PeakName
--	Elevation
--Filter all peaks in Bulgaria with elevation over 2835. Return the all rows sorted by elevation in descending order.
USE Geography
GO

SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation FROM Peaks AS p
INNER JOIN Mountains AS m
ON p.MountainId = m.Id
INNER JOIN MountainsCountries AS mc
ON p.MountainId = mc.MountainId
INNER JOIN Countries AS c
ON  mc.CountryCode = c.CountryCode
WHERE p.Elevation > 2835 AND c.CountryCode='BG'
ORDER BY p.Elevation DESC
