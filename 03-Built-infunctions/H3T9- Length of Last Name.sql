--Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.
USE SoftUni
GO

SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE LEN(e.LastName)=5