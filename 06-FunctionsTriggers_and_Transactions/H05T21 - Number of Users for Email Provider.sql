USE Diablo
GO

SELECT RIGHT(u.Email, LEN(u.Email) - CHARINDEX('@', u.Email)) AS 'Email Provider', COUNT(u.Email) AS 'Number Of Users' FROM Users AS u
WHERE LEN(u.Email) >0
GROUP BY RIGHT(u.Email, LEN(u.Email) - CHARINDEX('@', u.Email))
ORDER BY 'Number Of Users' DESC, 'Email Provider'