----Section3 - 04.Extract Top 5 Most Highly Rated Airlines which have any Flights

SELECT TOP 5 
	   a.AirlineID, 
	   a.AirlineName, 
	   a.Nationality, 
	   a.Rating 
  FROM Airlines AS a
 INNER JOIN Flights AS f
    ON f.AirlineID = a.AirlineID
 GROUP BY a.AirlineID, a.AirlineName, a.Nationality, a.Rating
 ORDER BY a.Rating DESC, a.AirlineID ASC