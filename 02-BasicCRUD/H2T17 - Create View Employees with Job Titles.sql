--Write a SQL query to create view V_EmployeeNameJobTitle with full employee name and job title. When middle name is NULL replace it with empty string (‘’). 
--Submit your query statements as Run skeleton, run queries & check DB.
USE SoftUni
GO

CREATE VIEW V_EmployeeNameJobTitle AS
SELECT e.FirstName + ' ' + ISNULL(e.MiddleName,'') + ' ' + e.LastName AS [Full Name], e.JobTitle  FROM Employees AS e
GO

SELECT * FROM V_EmployeeNameJobTitle