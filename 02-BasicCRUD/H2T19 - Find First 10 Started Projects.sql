--Write a SQL query to find first 10 started projects. 
--Select all information about them and sort them by start date, then by name. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT TOP 10 * FROM Projects AS p
ORDER BY p.StartDate, p.Name