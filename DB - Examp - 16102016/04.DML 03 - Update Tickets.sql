-- DML 03 - Update Tickets

UPDATE [dbo].[Tickets]
SET [Price] = [Price] * 1.5
WHERE FlightID = (SELECT Rating.FlightID FROM 
					(SELECT TOP 1 fl.FlightID, MAX(a.Rating) AS MaxRating FROM Flights AS fl
					 INNER JOIN Airlines AS a
					 ON a.AirlineID = fl.FlightID
					 GROUP BY fl.FlightID
					 ORDER BY MAX(a.Rating) DESC
					) AS Rating
				 )