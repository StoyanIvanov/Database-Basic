--Write a stored procedure usp_GetEmployeesFromTown that accepts town name as parameter and return 
--the employees’ first and last name that live in the given town. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

CREATE PROCEDURE usp_GetEmployeesFromTown(@townName VARCHAR(50))
AS
BEGIN
	SELECT e.FirstName, e.LastName FROM Employees AS e
	INNER JOIN Addresses AS a
	ON a.AddressID = e.AddressID
	INNER JOIN Towns AS t
	ON t.TownID = a.TownID
	WHERE t.Name = @townName
END

EXEC usp_GetEmployeesFromTown @townName = "Sofia"
