/* Final Project Procedures */

-- #1 Stored Procedure to retrieve and display data -- 

--Use Music;
--GO
--CREATE PROC 
--spTrackLength
--AS
--SELECT Length
--FROM  Track
--GO
--EXEC spTrackLength

-- #2 Stored Procedure that takes input parameter --

--USE Music;
--GO
--CREATE PROC spArtists
--@ArtistName nvarchar(50)
--AS
--SELECT Name
--FROM dbo.Artists
--WHERE Name = @ArtistName;
--GO
--EXEC spArtists @ArtistName = 'Kanye West';

-- #3 Stored Procedure w/ input and output parameters --

--USE Music;
--GO
--IF OBJECT_ID('spMediaPrice') IS NOT NULL
--	DROP PROC spMediaPrice
--GO
--CREATE PROC  spMediaPrice
--	@Type varchar(20),
--	@Price money OUTPUT
--AS
--BEGIN
--	SELECT @Price = Price
--	FROM [Media Type]
--	WHERE Type = @Type
--END
--GO
--DECLARE @MediaPrice money
--EXEC spMediaPrice 'MP3', @MediaPrice OUTPUT;
--SELECT @MediaPrice AS [MP3 Price];

-- #4 Stored Procedure w/ return value --

--IF OBJECT_ID('spNumberOfTracks') IS NOT NULL
--	DROP PROC spNumberOfTracks
--GO
--CREATE PROC spNumberOfTracks
--AS

--DECLARE @TrackCount int;

--SELECT @TrackCount = COUNT(Name)
--FROM Track;

--RETURN @TrackCount;
--GO

--DECLARE @TrackCount int;
--EXEC @TrackCount = spNumberOfTracks;
--PRINT 'Total number of tracks: ' + CONVERT(varchar, @TrackCount);

/* Final Project User Defined Functions */

-- #1 Scalar Function w/ an argument --

--IF OBJECT_ID('fnRecordCompany') IS NOT NULL
--	DROP FUNCTION fnRecordCompany
--GO
--CREATE FUNCTION fnRecordCompany
--	(@CompanyName varchar(50))
--	RETURNS int
--BEGIN
--	RETURN (SELECT LabelID FROM [Record Label] WHERE Name = @CompanyName);
--END;
--GO
--SELECT Name, City, Country
--FROM [Record Label]
--WHERE LabelID = dbo.fnRecordCompany('Apple Records');

-- #2 Table Function w/ an argument --

--CREATE FUNCTION fnLabelCity
--    (@City varchar(50))
--    RETURNS table
--    RETURN (SELECT Name, City, Country
--	       FROM [Record Label]
--		   WHERE City = @City);
--GO
--SELECT * FROM dbo.fnLabelCity('Hollywood');
--SELECT * FROM dbo.fnLabelCity('New York');
--SELECT * FROM dbo.fnLabelCity('London');

-- #3 2nd Table Function w/ an argument --

--IF OBJECT_ID('fnPrice') IS NOT NULL
--	DROP FUNCTION fnPrice
--GO
--CREATE FUNCTION fnPrice
--    (@MediaPrice money)
--    RETURNS table
--    RETURN (SELECT Type, Price
--	       FROM [Media Type]
--		   WHERE Price = @MediaPrice);
--GO
--SELECT * FROM dbo.fnPrice('11.99');
--SELECT * FROM dbo.fnPrice('99.99');
--SELECT * FROM dbo.fnPrice('29.99');

/* Final Project Triggers */

-- #1 Trigger that adds deleted data from one table to another --

--IF OBJECT_ID('TrackArchive') IS NOT NULL
--	DROP TABLE TrackArchive;
--CREATE TABLE TrackArchive (
--	AlbumID int NOT NULL,
--	Number int PRIMARY KEY NOT NULL,
--	Name varchar(30) NOT NULL,
--	GenreID int NOT NULL,
--	Length time(7) NULL
--)


--GO
--IF OBJECT_ID('Track_DELETE') IS NOT NULL
--	DROP TRIGGER Track_DELETE
--GO
--CREATE TRIGGER Track_DELETE
--	ON Track
--	AFTER DELETE
--AS
--INSERT INTO TrackArchive (AlbumID, Number, Name, GenreID, Length)
--	SELECT AlbumID, Number, Name, GenreID, Length
--	FROM DELETED
--	GO
--DELETE Track
--WHERE Number = 3;
--GO
--SELECT * FROM TrackArchive;

-- #2 Insert Trigger --

--IF OBJECT_ID('Track_INSERT') IS NOT NULL
--	DROP TRIGGER Track_INSERT
--GO
--CREATE TRIGGER Track_INSERT
--	ON Track
--	AFTER INSERT
--AS
--PRINT ('New track added to Track table.');

--GO
--INSERT Track
--VALUES (4, 3, 'All Falls Down', 3, '03:43:00.0000000')

--SELECT * FROM Track
--WHERE AlbumID = 4;

-- #3 Update Trigger --

--IF OBJECT_ID('Track_INSERT') IS NOT NULL
--	DROP TRIGGER Track_INSERT
--GO
--CREATE TRIGGER Track_INSERT
--	ON Track
--	AFTER UPDATE
--AS
--PRINT ('Track updated successfully.');

--GO
--UPDATE Track
--SET Name = 'While My Guitar Gently Weeps'
--WHERE AlbumID = 1;