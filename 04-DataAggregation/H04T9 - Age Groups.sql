--Write down a query that creates 7 different groups based on their age.
--Age groups should be as follows:
--	[0-10]
--	[11-20]
--	[21-30]
--	[31-40]
--	[41-50]
--	[51-60]
--	[61+]
--The query should return
--	Age groups
--	Count of wizards in it
USE Gringotts
GO

SELECT w.AgeGroup, Sum(w.Coun) as WizardCount 
FROM
(SELECT
CASE 
when wd.Age>= 0 and wd.Age<=10 then '[0-10]'
when wd.Age>= 11 and wd.Age<=20 then '[11-20]'
when wd.Age>= 21 and wd.Age<=30 then '[21-30]'
when wd.Age>= 31 and wd.Age<=40 then '[31-40]'
when wd.Age>= 41 and wd.Age<=50 then '[41-50]'
when wd.Age>= 51 and wd.Age<=60 then '[51-60]'
ELSE '[61+]' 
END AS AgeGroup,
COUNT(wd.Id) AS Coun
FROM WizzardDeposits AS WD 
GROUP BY wd.Age) AS w
GROUP BY w.AgeGroup