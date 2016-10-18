--Select the deposit group with the lowest average wand size.
USE Gringotts
GO

SELECT  w.DepositGroup FROM WizzardDeposits AS w
GROUP BY w.DepositGroup
HAVING AVG(w.MagicWandSize)<=20