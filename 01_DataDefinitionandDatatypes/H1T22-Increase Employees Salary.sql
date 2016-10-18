--Use SoftUni database and increase the salary of all employees by 10%. 
--Select only Salary column from the Employees table. 
--Submit your query statements as Prepare DB & Run queries.

USE SoftUni
GO

UPDATE Employees
SET Salary=Salary * 1.1
SELECT Salary FROM Employees