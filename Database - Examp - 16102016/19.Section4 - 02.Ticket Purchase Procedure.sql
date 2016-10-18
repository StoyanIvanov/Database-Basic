----Section4 - 02.Ticket Purchase Procedure

CREATE PROCEDURE usp_PurchaseTicket(@CustomerID INT, @FlightID INT, @TicketPrice DECIMAL(8,2), @Class VARCHAR(6), @Seat VARCHAR(5))
AS
BEGIN
	BEGIN TRAN

	DECLARE @TicketID INT;
	SET @TicketID = (SELECT TOP 1 
							t.TicketID 
					   FROM Tickets AS t
					  ORDER BY t.TicketID DESC
					 ) + 1;

	INSERT INTO Tickets(TicketID, Price, Class, Seat, CustomerID, FlightID)
	VALUES (@TicketID, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID)

	IF((SELECT cba.Balance
	      FROM CustomerBankAccounts AS cba
		 WHERE cba.CustomerID = @CustomerID)-@TicketPrice < 0)
	BEGIN
		ROLLBACK;
		RAISERROR ('Insufficient bank account balance for ticket purchase.', 16, 1);
	END
	ELSE
	BEGIN
		COMMIT;
	END
END

--EXEC usp_PurchaseTicket @CustomerID = 1, @FlightID = 5, @TicketPrice = 100, @Class = 'First', @Seat = '233-A'