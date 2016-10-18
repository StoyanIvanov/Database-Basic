USE Diablo
GO

SELECT i.Name, i.Price, i.MinLevel, st.Strength, st.Defence, st.Speed, st.Luck, st.Mind FROM Items AS i
INNER JOIN [Statistics] AS st
ON st.Id = i.StatisticId
WHERE
st.Speed > (SELECT AVG(st.Speed) FROM [Statistics] AS st) AND
st.Luck > (SELECT AVG(st.Luck) FROM [Statistics] AS st) AND
st.Mind > (SELECT AVG(st.Mind) FROM [Statistics] AS st)
