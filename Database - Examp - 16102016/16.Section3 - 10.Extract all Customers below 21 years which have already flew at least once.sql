----Section3 - 10.Extract all Customers below 21 years, which have already flew at least once

SELECT c.CustomerID, 
       CONCAT(c.FirstName, ' ', c.FirstName) AS FullName,
	   DATEDIFF(YEAR, c.DateOfBirth ,'2016-01-01') AS Age
  FROM Customers AS c
  INNER JOIN Tickets AS t
     ON t.CustomerID = c.CustomerID
  INNER JOIN Flights AS f
     ON f.FlightID = t.FlightID
	AND f.Status = 'Arrived'
  WHERE DATEDIFF(YEAR, c.DateOfBirth ,'2016-01-01') < 21
  ORDER BY Age DESC, c.CustomerID ASC