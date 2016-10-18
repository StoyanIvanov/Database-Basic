--Create stored procedure usp_GetEmployeesSalaryAbove35000 that returns all employees’ first and last names for whose salary is above 35000. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
BEGIN
DECLARE @salary INT = 35000
SELECT e.FirstName, e.LastName 
  FROM [dbo].[Employees] AS e
 WHERE e.Salary > @salary
END

EXEC usp_GetEmployeesSalaryAbove35000