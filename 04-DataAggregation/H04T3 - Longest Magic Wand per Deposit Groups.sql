--For wizards in each deposit group show the longest magic wand. Rename the new column appropriately.
USE Gringotts
GO

SELECT w.DepositGroup, MAX(w.MagicWandSize) AS LongestMagicWand FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

