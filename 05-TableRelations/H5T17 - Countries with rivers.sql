--Write a query that selects:
--	CountryName
--	RiverName
--Find the first 5 countries with or without rivers in Africa. 
--Sort them by CountryName in ascending order.
USE Geography
GO


SELECT TOP 5 c.CountryName, r.RiverName FROM Countries AS c
LEFT OUTER JOIN CountriesRivers as cr
ON cr.CountryCode = c.CountryCode
LEFT OUTER JOIN Rivers AS r
ON r.Id = cr.RiverId
WHERE c.ContinentCode='AF'
ORDER BY c.CountryName