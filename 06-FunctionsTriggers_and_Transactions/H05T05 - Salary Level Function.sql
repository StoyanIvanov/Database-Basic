--Write a function ufn_GetSalaryLevel(@salary MONEY) that receives salary of an employee and returns the level of the salary.
--	If salary is < 30000 return “Low”
--	If salary is between 30000 and 50000 (inclusive) return “Average”
--	If salary is > 50000 return “High”
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @returnValue VARCHAR(10);
	IF (@salary<30000) 
	BEGIN
		SET @returnValue = 'Low'
	END ELSE IF (@salary>=30000 AND @salary<=50000)
	BEGIN
		SET @returnValue = 'Average'
	END ELSE IF(@salary>50000)
	BEGIN
		SET @returnValue = 'High'
	END

	RETURN @returnValue;
END;
GO

SELECT e.Salary, dbo.ufn_GetSalaryLevel(e.Salary) AS 'Salary Level' FROM Employees AS e