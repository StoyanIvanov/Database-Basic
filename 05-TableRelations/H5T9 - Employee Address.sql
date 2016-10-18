--Write a query that selects:
--	EmployeeId
--	JobTitle
--	AddressId
--	AddressText
--Return the first 5 rows sorted by AddressId in ascending order.


USE SoftUni
GO

SELECT TOP 5 e.EmployeeID, e.JobTitle, a.AddressID, a.AddressText FROM Employees AS e
INNER JOIN Addresses AS a
ON e.AddressID = a.AddressID
ORDER BY a.AddressID
