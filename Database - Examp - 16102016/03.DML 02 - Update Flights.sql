--DML 02 - Update Flights

UPDATE [dbo].[Flights]
SET AirlineID = 1
WHERE [Status] = 'Arrived'