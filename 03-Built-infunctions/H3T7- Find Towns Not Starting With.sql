--Write a SQL query to find all towns that does not start with letters R, B or D. Order them alphabetically by name.
--Submit your query statements as Prepare DB & run queries.
USE SoftUni
GO

SELECT * FROM Towns AS t
WHERE t.Name NOT LIKE '[RBD]%'
ORDER BY t.Name