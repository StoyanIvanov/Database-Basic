--Select all deposit groups and its total deposit sum.
USE Gringotts
GO

SELECT w.DepositGroup, SUM(w.DepositAmount) FROM WizzardDeposits AS w
GROUP BY w.DepositGroup