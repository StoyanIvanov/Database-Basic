--Write a query that selects:
--	EmployeeID
--	FirstName
--	Salary
--	DepartmentName
--Filter only employees with salary higher than 15000. Return the first 5 rows sorted by DepartmentID in ascending order.


USE SoftUni
GO

SELECT TOP 5 e.EmployeeID, e.FirstName, e.Salary, d.Name AS DepartmenName FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID
WHERE e.Salary>15000
ORDER BY d.DepartmentID