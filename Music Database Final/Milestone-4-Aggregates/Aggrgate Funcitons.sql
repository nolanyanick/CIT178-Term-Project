/**/
USE Music;

SELECT COUNT(*) AS [Beatles Songs]
FROM Track
WHERE AlbumID = 1 OR AlbumID = 6;



--SELECT MIN([Media Type].Price) AS [Lowest Priced Product],
--	   MAX([Media Type].Price) AS [Highest Priced Product]
--	   FROM [Media Type];



--SELECT AVG([Media Type].Price) AS [Average Price In Store]
--FROM [Media Type];



--SELECT Name, COUNT(*) AS [Number of Copies]
--FROM Track
--GROUP BY Name;
