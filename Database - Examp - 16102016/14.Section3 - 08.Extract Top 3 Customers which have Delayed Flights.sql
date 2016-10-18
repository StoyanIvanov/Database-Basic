----Section3 - 08.Extract Top 3 Customers which have Delayed Flights

SELECT TOP 3 
	   c.CustomerID, 
	   CONCAT(c.FirstName, ' ', c.LastName) AS FullName, 
	   t.Price AS TicketPrice, 
	   a.AirportName AS Destination
  FROM Customers AS c
  INNER JOIN Tickets AS t
     ON t.CustomerID = c.CustomerID
  INNER JOIN Flights AS f
     ON f.FlightID = t.FlightID 
	AND f.Status = 'Delayed'
  INNER JOIN Airports AS a
     ON a.AirportID = f.DestinationAirportID
  ORDER BY t.Price DESC, t.TicketID DESC