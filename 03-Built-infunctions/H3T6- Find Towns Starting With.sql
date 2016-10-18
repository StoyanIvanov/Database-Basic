--Write a SQL query to find all towns that start with letters M, K, B or E. Order them alphabetically by town name. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT * FROM Towns AS t
WHERE t.Name LIKE '[MKBE]%'
ORDER BY t.Name