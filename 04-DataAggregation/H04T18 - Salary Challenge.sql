USE SoftUni
GO

SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentID
FROM Employees AS e
WHERE e.Salary > (
	SELECT AVG(inside.Salary)
	FROM Employees AS inside
	WHERE inside.DepartmentID = e.DepartmentID
	GROUP BY inside.DepartmentID
)
ORDER BY e.DepartmentID
