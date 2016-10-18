--Create stored procedure usp_GetEmployeesSalaryAboveNumber that accept a number (of type MONEY) as parameter 
--and return all employees’ first and last names whose salary is above or equal to the given number. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@salary Money)
AS
BEGIN
	SELECT e.FirstName, e.LastName FROM Employees AS e
	WHERE e.Salary >= @salary
END

EXEC usp_GetEmployeesSalaryAboveNumber @salary=10000
