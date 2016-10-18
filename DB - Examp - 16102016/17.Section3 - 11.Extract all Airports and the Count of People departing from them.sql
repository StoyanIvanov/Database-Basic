----Section3 - 11.Extract all Airports and the Count of People departing from them

SELECT a.AirportID, 
	   a.AirportName, 
	   COUNT(t.TicketID) AS Passengers 
  FROM Airports AS a
 INNER JOIN Flights AS f
    ON f.OriginAirportID = a.AirportID
   AND f.Status = 'Departing'
 INNER JOIN Tickets AS t
    ON t.FlightID = f.FlightID
 INNER JOIN Customers AS c
    ON c.CustomerID = t.CustomerID
 GROUP BY a.AirportID, a.AirportName