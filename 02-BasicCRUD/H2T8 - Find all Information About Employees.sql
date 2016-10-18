--Write a SQL query to find all information about the employees whose job title is “Sales Representative”. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT * FROM Employees
WHERE [Employees].JobTitle='Sales Representative'