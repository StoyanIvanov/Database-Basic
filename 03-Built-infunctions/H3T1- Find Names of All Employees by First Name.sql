--Write a SQL query to find first and last names of all employees whose first name starts with “SA”. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE LEFT(e.FirstName,2)='SA'