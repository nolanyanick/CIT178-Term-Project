/* Final Project Views  */

 --Read Only View --

--USE Music;
--GO
--IF OBJECT_ID('Total Number of Songs') IS NOT NULL
--	DROP VIEW [Total Number of Songs]
--GO
--CREATE VIEW [Total Number of Songs]
--WITH ENCRYPTION
--AS
--SELECT COUNT(Number) AS [# of Tracks]
--FROM Track;
--GO 
--SELECT * FROM [Total Number of Songs];
--GO

-- --Updateable View --

--USE Music;
--GO 
--CREATE VIEW Albums_Updateable
--WITH ENCRYPTION
--AS
--SELECT Title, AlbumID, ArtistID
--FROM Albums;
--GO 
--SELECT * FROM Albums_Updateable;
--GO

-- --Editing Record using View --

--USE Music;
--GO
--SELECT * FROM Albums_Updateable;
--GO
--UPDATE Albums_Updateable
--SET Title = 'Rubber Soul'
--WHERE AlbumID = 1;
--GO
--SELECT * FROM ItemsOrdered_Update;
--GO

-- --View with Multiple Tables --

--USE Music;
--GO
--IF OBJECT_ID('Tracks & ALbums') IS NOT NULL
--	DROP VIEW [Tracks & Albums]
--GO
--CREATE VIEW [Tracks & Albums]
--AS
--SELECT Number, Name AS [Track], Title AS [Album], dbo.Albums.AlbumID
--FROM Track JOIN Albums ON Track.AlbumID = Albums.AlbumID;
--GO
--SELECT * FROM [Tracks & Albums];
--GO

-- --System Catalog of Views --

--SELECT [name], create_date, modify_date
--FROM sys.views;