--Write a SQL query to create view V_EmployeesHiredAfter2000 with first and last name to all employees hired after 2000 year. 
--Submit your query statements as Run skeleton, run queries & check DB.
USE SoftUni
GO

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE Year(e.HireDate)>2000

SELECT * FROM V_EmployeesHiredAfter2000