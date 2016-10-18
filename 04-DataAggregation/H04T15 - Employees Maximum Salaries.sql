--Find the max salary for each department. Filter those which have max salaries not in the range 30000 and 70000;
USE SoftUni
GO

SELECT e.DepartmentID, MAX(e.Salary) AS MaxSalary FROM Employees AS e
GROUP BY e.DepartmentID
HAVING MAX(e.Salary) NOT BETWEEN 30000 AND 70000