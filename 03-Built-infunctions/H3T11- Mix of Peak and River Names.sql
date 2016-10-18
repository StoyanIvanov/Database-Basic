--Combine all peak names with all river names, so that the last letter of each peak name is the same like the first letter of its corresponding river name. 
--Display the peak names, river names, and the obtained mix. Sort the results by the obtained mix. 
--Submit your query statements as Prepare DB & run queries.
USE Geography
GO

SELECT  [Peaks].PeakName, [Rivers].RiverName, LOWER(PeakName + SUBSTRING(RiverName,2,len(RiverName))) AS 'Mix' FROM Rivers
CROSS JOIN Peaks
WHERE LEFT(RiverName,1)=RIGHT(PeakName,1)
ORDER BY Mix