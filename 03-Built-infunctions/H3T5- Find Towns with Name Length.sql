--Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. 
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT t.Name FROM Towns AS t
WHERE LEN(t.Name) BETWEEN 5 AND 6
ORDER BY t.Name