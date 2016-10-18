USE Diablo
GO

SELECT i.Name AS Item, i.Price, i.MinLevel, gt.Name AS 'Forbidden Game Type' FROM Items AS i
INNER JOIN GameTypeForbiddenItems AS gtfi
ON gtfi.ItemId = i.Id
INNER JOIN GameTypes AS gt
ON gt.Id = gtfi.GameTypeId
ORDER BY gt.Name DESC, i.Name
	