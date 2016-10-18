----Section3 - 06.Extract all Customers which are departing from their Home Town

SELECT c.CustomerID, 
       CONCAT(c.FirstName, ' ', c.LastName) AS FullName, 
	   t.TownName AS HomeTown 
  FROM Customers AS c
 INNER JOIN Towns AS t
    ON t.TownID = c.HomeTownID
 INNER JOIN Tickets AS tic
    ON tic.CustomerID = c.CustomerID
 INNER JOIN Flights AS f
    ON f.FlightID = tic.FlightID
 INNER JOIN Airports AS a
    ON a.AirportID = f.DestinationAirportID
 WHERE c.HomeTownID = a.TownID
 GROUP BY c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName), t.TownName
 ORDER BY c.CustomerID ASC