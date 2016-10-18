--Find all countries along with information about their currency. 
--Display the country code, country name and information about its currency: either "Euro" or "Not Euro". 
--Sort the results by country name alphabetically. Submit your query statements as Prepare DB & run queries.
USE Geography
GO

SELECT c.CountryName, 
	   c.CountryCode, 
	   CASE
		   WHEN c.CurrencyCode = 'EUR' THEN 'Euro'
		   ELSE 'Not Euro'
		   END AS 'Currency info'
 FROM Countries AS c
ORDER BY c.CountryName