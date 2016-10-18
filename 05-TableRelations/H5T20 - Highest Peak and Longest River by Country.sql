--For each country, find the elevation of the highest peak and the length of the longest river, 
--sorted by the highest peak elevation (from highest to lowest), then by the longest river length (from longest to smallest), 
--then by country name (alphabetically). Display NULL when no data is available in some of the columns. 
--Submit for evaluation the result grid with headers. Limit only the first 5 rows.
USE Geography
GO

SELECT TOP 5 c.CountryName, MAX(p.Elevation) AS HighestPeakElevation, MAX(r.Length) AS LongestRiverLength FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON m.Id = mc.MountainId
INNER JOIN Peaks AS p
ON p.MountainId = m.Id
LEFT OUTER JOIN CountriesRivers AS cr
ON cr.CountryCode = c.CountryCode
LEFT OUTER JOIN Rivers AS r
ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName
