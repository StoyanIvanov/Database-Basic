--Write a query that selects:
--	EmployeeID
--	FirstName
--	ProjectName
--Filter all the projects of employee with id 24. If the project has started before 2005 the return value should be NULL.
USE SoftUni
GO

SELECT e.EmployeeID, e.FirstName, p.Name AS ProectName FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID=ep.EmployeeID
LEFT OUTER JOIN Projects AS p
ON ep.ProjectID=p.ProjectID AND p.StartDate < '2005-01-01'
WHERE ep.EmployeeID=24