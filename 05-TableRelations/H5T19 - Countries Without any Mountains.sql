--Write a query that selects CountryCode. Find all the count of all countries which don’t have a mountain.
USE Geography
GO

SELECT COUNT(c.CountryCode) AS CountryCode FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL