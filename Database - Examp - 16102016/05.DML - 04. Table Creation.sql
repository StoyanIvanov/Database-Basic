--DML - 04. Table Creation
USE AMS
GO

CREATE TABLE CustomerReviews(
ReviewID INT PRIMARY KEY,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade INT
CONSTRAINT chk_ReviewGrade CHECK (ReviewGrade BETWEEN 0 AND 10),
AirlineID INT NOT NULL
CONSTRAINT FK_CustomerReviews_Airline_Airline FOREIGN KEY(AirlineID)
REFERENCES [dbo].[Airlines]([AirlineID]),
CustomerID INT NOT NULL
CONSTRAINT FK_CustomerReviews_Customer_Customer FOREIGN KEY(CustomerID)
REFERENCES [dbo].[Customers]([CustomerID])
)

CREATE TABLE CustomerBankAccounts(
AccountID INT PRIMARY KEY,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL(10,2) NOT NULL,
CustomerID INT NOT NULL
CONSTRAINT FK_CustomerBankAccounts_Customer_Customer FOREIGN KEY(CustomerID)
REFERENCES [dbo].[Customers]([CustomerID])
)