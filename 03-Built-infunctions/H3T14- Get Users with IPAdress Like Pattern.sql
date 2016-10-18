--Find all users along with their IP addresses sorted by username alphabetically. 
--Display only rows that IP address matches the pattern: “***.1^.^.***”. 
--Submit your query statements as Prepare DB & run queries.
--Legend: * - one symbol, ^ - one or more symbols
USE Diablo
GO

SELECT u.Username, u.IpAddress FROM Users AS u
WHERE u.IpAddress LIKE '___.1%.%.___'
ORDER BY u.Username
