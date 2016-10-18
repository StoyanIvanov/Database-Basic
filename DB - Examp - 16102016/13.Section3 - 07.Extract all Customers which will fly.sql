----Section3 - 07.Extract all Customers which will fly

SELECT c.CustomerID, 
	   CONCAT(c.FirstName, ' ', c.LastName) AS FullName, 
	   DATEDIFF(YEAR, c.DateOfBirth, '2016-01-01') AS Age 
  FROM Customers AS c
 INNER JOIN Tickets AS t
    ON t.CustomerID = c.CustomerID
 INNER JOIN Flights AS f
    ON f.FlightID = t.FlightID
   AND f.Status = 'Departing'
 GROUP BY c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName), DATEDIFF(YEAR, c.DateOfBirth, '2016-01-01')
 ORDER BY c.CustomerID ASC