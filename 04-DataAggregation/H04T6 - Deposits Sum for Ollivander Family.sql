--Problem 6.	Deposits Sum for Ollivander Family
--Select all deposit groups and its total deposit sum but only for the wizards who has their magic wand crafted by Ollivander family.
USE Gringotts
GO

SELECT w.DepositGroup, SUM(w.DepositAmount) FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup