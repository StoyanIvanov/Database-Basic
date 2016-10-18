--That’s it! You no longer work for Mr. Bodrog. You have decided to find a proper job as an analyst in SoftUni. 
--It’s not a surprise that you will use the SoftUni database. Things get more exciting here!
--Select the minimum salary from the employees for departments with ID (2,5,7) but only for those who are hired after 01/01/2000.
--Your query should return:	
--	DepartmentID
USE SoftUni
GO

SELECT e.DepartmentID, MIN(e.Salary) FROM Employees AS e
WHERE e.DepartmentID LIKE '[257]' AND e.HireDate > '01/01/2000'
GROUP BY e.DepartmentID