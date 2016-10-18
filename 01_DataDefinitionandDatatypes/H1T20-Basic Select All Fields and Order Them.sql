--Modify queries from previous problem by sorting:
--	Towns - alphabetically by name
--	Departments - alphabetically by name
--	Employees - descending by salary
--Submit your query statements as Prepare DB & Run queries.

USE SoftUni
GO

SELECT * FROM Towns ORDER BY Name
SELECT * FROM Departments ORDER BY Name
SELECT * FROM Employees ORDER BY Salary DESC