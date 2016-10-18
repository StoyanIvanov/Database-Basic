--Import the database and send the total count of records to Mr. Bodrog. Make sure nothing got lost.
USE Gringotts
GO

SELECT COUNT(*) AS GringosCount FROM WizzardDeposits as w