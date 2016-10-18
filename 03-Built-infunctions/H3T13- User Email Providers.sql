--Find all users along with information about their email providers. Display the username and email provider. 
--Sort the results by email provider alphabetically, then by username. 
--Submit your query statements as Prepare DB & run queries.
USE Diablo
GO

SELECT u.Username, SUBSTRING(u.Email, CHARINDEX('@', u.Email,1)+1, lEN(u.Email)) AS 'Email Provider' FROM Users AS u
ORDER BY [Email Provider], [Username]