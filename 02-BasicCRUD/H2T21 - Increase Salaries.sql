--Write a SQL query to increase salaries of all employees that are in the Engineering, Tool Design, Marketing or Information Services department by 12%. 
--Then select Salaries column from the Employees table. After that exercise restore your database to revert those changes. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

UPDATE Employees
SET Salary = Salary * 1.12
FROM Employees AS e
JOIN Departments AS d
  ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Engineering' OR d.Name='Tool Design' OR d.Name='Marketing' OR d.Name = 'Information Services'
SELECT e.Salary FROM Employees AS e