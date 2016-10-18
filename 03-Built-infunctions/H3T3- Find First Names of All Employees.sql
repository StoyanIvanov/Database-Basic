--Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusive. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT e.FirstName FROM Employees AS e
WHERE (e.DepartmentID=3 OR e.DepartmentID=10) AND (e.HireDate BETWEEN '1995/01/01' AND '2005/12/31')