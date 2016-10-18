--Define a function ufn_IsWordComprised(@setOfLetters, @word) that returns true or false depending 
--on that if the word is a comprised of the given set of letters. 
--Submit your query statement as Run skeleton, run queries & check DB in Judge.
Use SoftUni
GO

CREATE TABLE SetOfLetters(
LetterID INT PRIMARY KEY IDENTITY(1,1),
Letter VARCHAR(50) NOT NULL,
Word VARCHAR(50) NOT NULL
)
GO

INSERT INTO SetOfLetters(Letter, Word)
VALUES 
('oistmiahf', 'Sofia'),
('oistmiahf', 'halves'),
('bobr', 'Rob'),
('pppp', 'Guy')
GO

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS VARCHAR(5)
BEGIN
	DECLARE @returnValue INT = 0;
	DECLARE @count INT = 1;
	WHILE @count < LEN(@word) + 1
	BEGIN
		IF (CHARINDEX(SUBSTRING(@word,@count,1),@setOfLetters)>0)
		BEGIN
			SET @returnValue = 1;
		END ELSE 
		BEGIN
			SET @returnValue = 0;
			RETURN @returnValue;
		END
		SET @count = @count + 1
	END;
	RETURN @returnValue;
END
GO

SELECT s.Letter, s.Word, dbo.ufn_IsWordComprised(s.Letter, s.Word) FROM SetOfLetters AS s
