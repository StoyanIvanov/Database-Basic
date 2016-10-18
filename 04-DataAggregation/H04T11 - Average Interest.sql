--Mr. Bodrog is highly interested in profitability. 
--He wants to know the average interest of all deposits groups split by whether the deposit has expired or not. 
--But that’s not all. He wants you to select deposits with start date after 01/01/1985. 
--Order the data descending by Deposit Group and ascending by Expiration Flag.
--The output should consist of the following columns:
USE Gringotts
GO

SELECT w.DepositGroup, w.IsDepositExpired, AVG(w.DepositInterest) FROM WizzardDeposits AS w
WHERE w.DepositStartDate > '01/01/1985'
GROUP BY w.DepositGroup, w.IsDepositExpired
ORDER BY w.DepositGroup DESC, w.IsDepositExpired
