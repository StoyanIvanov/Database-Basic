----Section3 - 02. Extract All Customers

SELECT c.CustomerID,
       CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
	   c.Gender 
  FROM Customers AS c
 ORDER BY FullName ASC, c.CustomerID ASC