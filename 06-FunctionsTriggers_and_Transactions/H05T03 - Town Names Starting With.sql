--Write a stored procedure usp_GetTownsStartingWith that accept string as parameter and returns all town names starting with that string. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
USE SoftUni
GO

CREATE PROCEDURE usp_GetTownsStartingWith(@inputString VARCHAR(10))
AS
BEGIN
	SELECT t.Name FROM Towns AS t
	WHERE LEFT(t.Name,LEN(@inputString))=@inputString
END

EXEC usp_GetTownsStartingWith @inputString = "B"