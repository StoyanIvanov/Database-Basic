--Write a query that selects:
--	EmployeeID
--	FirstName
--Filter only employees without a project. Return the first 3 rows sorted by EmployeeID in ascending order.


USE SoftUni
GO

SELECT TOP 3 e.EmployeeID, e.FirstName FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL
ORDER BY e.EmployeeID