--Write a SQL query to find the first and last names of all employees whose job titles does not contain “engineer”. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE e.JobTitle NOT LIKE '%engineer%'