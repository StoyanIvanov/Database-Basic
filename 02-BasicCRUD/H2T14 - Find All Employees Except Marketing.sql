--Write a SQL query to find the first and last names of all employees whose department ID is different from 4. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT e.FirstName, e.LastName FROM Employees e
WHERE e.DepartmentID <> 4	