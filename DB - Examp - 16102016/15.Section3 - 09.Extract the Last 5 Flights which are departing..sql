----Section3 - 09.Extract the Last 5 Flights, which are departing.

SELECT TOP 5 
	   f.FlightID,
	   f.DepartureTime,
	   f.ArrivalTime,
	   (SELECT a.AirportName FROM Airports AS a WHERE a.AirportID = f.OriginAirportID) AS Origin,
	   (SELECT a.AirportName FROM Airports AS a WHERE a.AirportID = f.DestinationAirportID) AS Destination
  FROM Flights AS f
 INNER JOIN Airports AS a
    ON a.AirportID = f.DestinationAirportID
 WHERE f.Status = 'Departing'
 ORDER BY f.DepartureTime ASC, f.FlightID ASC