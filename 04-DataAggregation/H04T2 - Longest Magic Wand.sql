--Select the size of the longest magic wand. Rename the new column appropriately.
USE Gringotts
GO

SELECT MAX(w.MagicWandSize) AS LongestMagicWand FROM WizzardDeposits as w