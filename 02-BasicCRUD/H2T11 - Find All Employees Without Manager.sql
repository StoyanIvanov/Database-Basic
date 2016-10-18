--Write a SQL query to find first and last names about those employees that does not have a manager. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT [Employees].FirstName, [Employees].LastName FROM Employees
WHERE ManagerID IS NULL