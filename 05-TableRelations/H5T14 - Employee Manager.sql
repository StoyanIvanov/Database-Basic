--Write a query that selects:
--	EmployeeID
--	FirstName
--	MangerID
--	ManagerName
--Filter all employees with a manager who has ID equals to 3 or 7. Return the all rows sorted by EmployeeID in ascending order.
USE SoftUni
GO

SELECT e.EmployeeID, e.FirstName, e.ManagerID, em.FirstName FROM Employees AS e
INNER JOIN Employees AS em
ON e.ManagerID=em.EmployeeID
WHERE em.EmployeeID=3 OR em.EmployeeID=7
ORDER BY e.EmployeeID