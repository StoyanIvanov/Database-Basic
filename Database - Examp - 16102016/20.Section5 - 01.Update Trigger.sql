----Section5 - 01.Update Trigger

--CREATE TABLE ArrivedFlights(
--FlightID INT PRIMARY KEY IDENTITY(1,1),
--ArrivalTime DATETIME2 NOT NULL,
--Origin VARCHAR(50) NOT NULL,
--Destination VARCHAR(50) NOT NULL,
--Passengers INT NOT NULL
--)

CREATE TRIGGER TR_StatusFlight
ON [dbo].[Flights]
AFTER UPDATE
AS
BEGIN
	INSERT INTO ArrivedFlights(FlightID, ArrivalTime, Origin, Destination, Passengers)
	SELECT i.FlightID, i.ArrivalTime, oa.AirportName, da.AirportName, COUNT(t.TicketID)
	  FROM inserted AS i
	 INNER JOIN Airports AS oa
	    ON oa.AirportID = i.OriginAirportID
	 INNER JOIN Airports AS da
	    ON da.AirportID = i.DestinationAirportID
	 INNER JOIN Tickets AS t
	    ON t.FlightID = i.FlightID
	 WHERE i.Status = 'Arrived' 
	 GROUP BY i.FlightID, i.ArrivalTime, oa.AirportName, da.AirportName
END