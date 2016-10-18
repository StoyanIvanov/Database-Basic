--Problem 16.	Employees Count Salaries
--Count the salaries of all employees who don’t have a manager.
USE SoftUni
GO

SELECT e.CountSalary AS Count FROM 
(
SELECT ie.ManagerID, COUNT(ie.Salary) AS CountSalary FROM Employees AS ie
WHERE ie.ManagerID IS NULL
GROUP BY ie.ManagerID
 ) AS e
