--17
--Find the third highest salary in each department if there is such. 

USE SoftUni
GO

SELECT empl.DepartmentID, empl.Salary FROM
(SELECT e.DepartmentID, e.Salary, DENSE_RANK() OVER(PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS Rank 
   FROM Employees AS e) AS empl
WHERE empl.Rank=3
GROUP BY empl.DepartmentID, empl.Salary