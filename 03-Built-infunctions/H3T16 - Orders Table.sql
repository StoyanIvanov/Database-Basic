--You are given a table Orders(Id, ProductName, OrderDate) filled with data. 
--Consider that the payment for that order must be accomplished within 3 days after the order date. 
--Also the delivery date is up to 1 month. Write a query to show each product’s name, order date, pay and deliver due dates. 
--Submit your query statements as Prepare DB & run queries.
USE Hotel
GO

CREATE TABLE Orders
(
Id INT PRIMARY KEY IDENTITY(1,1),
ProductName NVARCHAR(100) NOT NULL,
OrderDate DATE NOT NULL
);

SELECT o.ProductName AS 'ProductName', 
		CONVERT(DATETIME2(3), o.OrderDate) AS 'OrderDate',
		CONVERT(DATETIME2(3), DATEADD(day, 3, o.OrderDate)) AS 'Pay Due', 
		CONVERT(DATETIME2(3), DATEADD(MONTH, 1, o.OrderDate)) AS 'Deliver Due' 
FROM Orders AS o
