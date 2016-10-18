--Write a SQL query to find last 7 hired employees. Select their first, last name and their hire date. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT TOP 7 e.FirstName, e.LastName, e.HireDate FROM Employees AS e
ORDER BY e.HireDate DESC