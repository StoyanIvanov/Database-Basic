----Section4 - 01.Review Registering Procedure

CREATE PROCEDURE usp_SubmitReview(@CustomerID INT, @ReviewContent VARCHAR(255), @ReviewGrade INT, @AirlineName VARCHAR(50))
AS
BEGIN
	DECLARE @AirlineID INT;
	SET @AirlineID =  (SELECT a.AirlineID 
					     FROM Airlines AS a
					    WHERE a.AirlineName = @AirlineName
					  );
	IF( @AirlineID > 0 )
	BEGIN
	DECLARE @ReviewID INT;
	SET @ReviewID = (SELECT TOP 1 
							cr.ReviewID 
					   FROM CustomerReviews AS cr
					  ORDER BY cr.ReviewID DESC
					 ) + 1;
		INSERT INTO CustomerReviews([ReviewID], [ReviewContent], [ReviewGrade], [AirlineID], [CustomerID])
		VALUES
		(@ReviewID, @ReviewContent, @ReviewGrade, @AirlineID, @CustomerID)		
	END
	ELSE
	BEGIN
		RAISERROR ('Airline does not exist.', 16, 1);
	END
END

--EXEC usp_SubmitReview @CustomerID = 1, @ReviewContent = 'Test content', @ReviewGrade = 2, @AirlineName = 'bla-bla'
