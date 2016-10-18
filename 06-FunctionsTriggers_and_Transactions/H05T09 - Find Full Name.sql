--You are given a database schema with tables AccountHolders(Id (PK), FirstName, LastName, SSN) 
	--and Accounts(Id (PK), AccountHolderId (FK), Balance).  
--Write a stored procedure usp_GetHoldersFullName that selects the full names of all people. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROCEDURE usp_GetHoldersFullName
AS
BEGIN
	SELECT ah.FirstName + ' ' + ah.LastName AS 'Full Name' FROM AccountHolders AS ah
END