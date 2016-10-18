--Write a query that returns all unique wizard first letters of their first names only if they have deposit of type Troll Chest. 
--Order them alphabetically. Use GROUP BY for uniqueness.
USE Gringotts
GO

SELECT w.letterGroup AS first_letter FROM 
(SELECT wz.DepositGroup, LEFT(wz.FirstName,1) AS letterGroup FROM WizzardDeposits AS wz) AS w
WHERE w.DepositGroup='Troll Chest'
GROUP BY w.letterGroup