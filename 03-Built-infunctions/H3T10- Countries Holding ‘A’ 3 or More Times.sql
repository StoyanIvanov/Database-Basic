--Find all countries that holds the letter 'A' in their name at least 3 times (case insensitively), sorted by ISO code. Display the country name and ISO code. 
--Submit your query statements as Prepare DB & run queries.
USE Geography
GO

SELECT c.CountryName, c.IsoCode FROM Countries AS c
WHERE LEN(c.CountryName) - LEN(REPLACE(c.CountryName, 'A',''))>=3
ORDER BY c.IsoCode 