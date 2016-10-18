--Select all employees who earn more than 30000 into a new table. 
--Then delete all employees who has ManagerID = 42; 
--Then increase the salaries of all employees with DepartmentID=1 with 5000. 
--Finally, select the average salaries in each department.
SELECT SoftUni
GO

SELECT * INTO newEmployees FROM Employees AS e
WHERE e.Salary > 30000

DELETE FROM newEmployees
WHERE newEmployees.ManagerID = 42

UPDATE newEmployees
SET Salary = Salary + 5000
WHERE newEmployees.DepartmentID=1

SELECT ne.DepartmentID, AVG(ne.Salary) AS 'AverageSalary' FROM newEmployees AS ne
GROUP BY ne.DepartmentID