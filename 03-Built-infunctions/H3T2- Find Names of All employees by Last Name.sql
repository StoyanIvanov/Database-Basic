--Write a SQL query to find first and last names of all employees whose last name contains “ei”. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE e.LastName LIKE '%ei%'