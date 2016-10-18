--Write a SQL query to find the full name of all employees whose salary is 25000, 14000, 12500 or 23600. 
--Full Name is combination of first, middle and last name (separated with single space) and they should be in one column called “Full Name”. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT [Employees].FirstName + ' '+ [Employees].MiddleName + ' ' + [Employees].LastName AS 'Full Name' FROM Employees
WHERE Salary=25000 OR Salary=14000 OR Salary=12500 OR Salary=23600