--Write a query that selects:
--	EmployeeID
--	FirstName
--	ProjectName
--Filter only employees with a project which has started after 13.08.2002 and it is still ongoing (no end date). 
--Return the first 5 rows sorted by EmployeeID in ascending order.

USE SoftUni
GO

SELECT TOP 5 e.EmployeeID, e.FirstName, p.Name FROM Employees AS e
INNER JOIN EmployeesProjects as ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '2002-08-13' AND p.EndDate IS NULL
ORDER BY e.EmployeeID