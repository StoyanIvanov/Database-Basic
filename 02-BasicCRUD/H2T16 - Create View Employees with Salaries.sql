--Write a SQL query to create a view V_EmployeesSalaries with first name, last name and salary for each employee. 
--Submit your query statements as Run skeleton, run queries & check DB.
USE SoftUni
GO

CREATE VIEW V_EmployeesSalaries AS
SELECT e.FirstName, e.LastName, e.Salary FROM Employees AS e
GO

SELECT * FROM V_EmployeesSalaries