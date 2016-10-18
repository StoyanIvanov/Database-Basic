--Write SQL query to find first and last names about 5 best paid Employees ordered descending by their salary. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT TOP 5 e.FirstName, e.LastName FROM Employees e
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC