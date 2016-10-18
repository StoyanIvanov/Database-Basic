----Section3 - 05.Extract all Tickets with price below 5000, for First Class

SELECT t.TicketID, 
	   a.AirportName AS Destination, 
	   CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName 
  FROM Tickets AS t
 INNER JOIN Flights AS f
    ON f.FlightID = t.FlightID
 INNER JOIN Airports AS a
    ON a.AirportID = f.DestinationAirportID
 INNER JOIN Customers as c
    ON c.CustomerID = t.CustomerID
 WHERE t.Price < 5000 AND t.Class = 'First'
 ORDER BY t.TicketID ASC