--/***********************************************************/
--/* Date			Programmer		Description		*/
--/*
--/* 3/4/2022		kjones			Initial creation of disk database */
--/*
--/*3/11/2022		kjones			Updating disk database*/
--/*
--/*3/18/2022		kjones			Updating disk database */
--/************************************************************/

use master;
go
DROP DATABASE IF EXISTS disk_inventorykj;
go
CREATE DATABASE disk_inventorykj;
go
--add server user
IF SUSER_ID('diskUserkj') IS NULL
	CREATE LOGIN diskUserkj
		WITH PASSWORD = 'Pa$$w0rd', 
		DEFAULT_DATABASE = disk_inventorykj;
use disk_inventorykj;
go
--add db user
CREATE USER diskUserkj;
ALTER ROLE db_datareader
	ADD MEMBER diskUserkj;
go

--create lookup tables
CREATE TABLE disk_type (
	disk_type_id  INT NOT NULL IDENTITY PRIMARY KEY,
	description		VARCHAR(20) NOT NULL
);-- CD, DVD, Vinyl, 8track, cassette
CREATE TABLE genre (
	genre_id  INT NOT NULL IDENTITY PRIMARY KEY,
	description		VARCHAR(20) NOT NULL
);-- Country, Metal, Rock, Alt
CREATE TABLE status (
	status_id  INT NOT NULL IDENTITY PRIMARY KEY,
	description		VARCHAR(20) NOT NULL
);  --Available, Onload, Damaged, 
CREATE TABLE borrower (
	borrower_id		INT NOT NULL IDENTITY PRIMARY KEY,
	fname			NVARCHAR(60) NOT NULL,
	lname			NVARCHAR(60) NOT NULL,
	phone_num		VARCHAR(15) NOT NULL		

);
CREATE TABLE disk (
	disk_id			INT NOT NULL IDENTITY PRIMARY KEY,
	disk_name		NVARCHAR(60) NOT NULL,
	release_date	DATE NOT NULL,
	genre_id		INT NOT NULL REFERENCES genre(genre_id),
	status_id		INT NOT NULL REFERENCES status(status_id),
	disk_type_id	INT NOT NULL REFERENCES disk_type
		(disk_type_id)
);
CREATE TABLE disk_has_borrower (
	disk_has_borrower_id	INT NOT NULL IDENTITY PRIMARY KEY,
	borrower_id				INT NOT NULL REFERENCES borrower
		(borrower_id),
	disk_id					INT NOT NULL REFERENCES disk
		(disk_id),
	borrowed_date			DATETIME2 NOT NULL,
	returned_date			DATETIME2 NULL
);
/****  End of Project 1 ****/
--- Insert data into disk_type

INSERT INTO disk_type
	(description)
VALUES 
('Movies'),
('Shows'),
('Documentaries'), 
('Anime'),
('Musicals');
----------
INSERT INTO genre
	(description)
VALUES 
	('Comedy')
	,('Drama') 
	,('Sport')
	,('Action') 
	,('Sci-Fi');
----------
INSERT INTO status
	(description)
VALUES 
	('Available') 
	,('On hold') 
	,('Lost') 
	,('Damaged')
	,('Out of stock')
	;
-------
INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('John', 'Smith', '223-553-1234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Caleb', 'Johnson', '243-113-1634');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Mark', 'Burger', '113-593-6234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Joshua', 'Jones', '883-773-3334');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Bob', 'Wilson', '553-983-7234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Sarah', 'Susan', '253-449-1785');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Margaret', 'Loius', '244-773-9034');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Mary', 'Monause', '200-853-7234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Kevin', 'Robbs', '203-543-1204');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Stuart', 'Mandor', '263-153-1204');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Max', 'Wills', '923-253-1534');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Angel', 'Road', '273-559-1004');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Susan', 'Anonthy', '123-653-1230');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Ivar', 'Zula', '723-653-3234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Ragner', 'Rock', '273-563-1204');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Bron', 'Ironside', '923-583-1224');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Happy', 'Gilmore', '923-453-9234');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Lagather', 'Lothbrook', '623-953-1230');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Igor', 'Wolf', '293-053-1274');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Christopher', 'Robin', '220-558-1034');

INSERT INTO borrower
	(fname, lname, phone_num)
VALUES 
('Robin', 'Marks', '283-550-1214');
----- Delete 1 borrower
DELETE borrower
WHERE borrower_id = 21;

----Insert disk 20 rows

INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Happy Gilmore', '3/07/1995', 1, 1, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Dark Knight', '11/05/1985', 1, 3, 2)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Star Wars', '12/07/2005', 3, 2, 4)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Grown Ups', '6/26/1999', 3, 1, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Friends', '3/07/1997', 3, 2, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Super Size me', '5/11/1998', 4, 2, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Happy Feet', '8/12/2000', 3, 2, 4)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('The last airbender', '9/10/2004', 2, 1, 5)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Gilmore Girls', '1/09/1992', 5, 3, 2)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('The last kingdom', '3/09/1994', 3, 3, 3)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Lord of the Rings', '4/01/1995', 3, 3, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Harry Potter', '7/02/1999', 4, 1, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Cars', '8/11/2005', 2, 4, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Vikings', '5/17/1995', 2, 3, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('The crusade', '11/15/1995', 4, 3, 2)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Band of Brothers', '12/14/1992', 3, 4, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('The blood prince', '10/27/2021', 3, 2, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('The 100', '9/15/2008', 2, 3, 4)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Peaky Blinders', '7/07/1994', 2, 4, 1)
;
INSERT disk
	(disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES 
('Oklahoma', '2/11/1950', 1, 4, 5)
;

--update 1 disk row with WHERE clause
UPDATE disk
SET release_date = '10/10/1994'
WHERE disk_name = 'The Pacific';
---Insert borrowed rows DiskHASBorrower table
INSERT disk_has_borrower
	(borrower_id, disk_id, borrowed_date, returned_date)
VALUES
	(1, 1, '1-2-2012', '2-15-2012')
	,(4, 5, '11-25-2017', '12-13-2016')
	,(2, 2, '10-25-2019', '12-15-2020')
	,(1, 5, '11-23-2015', '11-18-2011')
	,(5, 1, '9-02-2012', '2-15-2012')
	,(3, 4, '11-27-2018', '5-13-2013')
	,(2, 4, '11-22-2006', '2-13-2011')
	,(3, 5, '9-20-2012', '7-12-2018')
	,(11, 14, '7-24-2014', NULL)
	,(12, 15, '8-2-2016', '2-11-2018')
	,(13, 15, '5-2-2017', '2-13-2019')
	,(14, 11, '4-2-2015', '2-12-2012')
	,(15, 11, '10-29-2017', '12-19-2020')
	,(8, 8, '11-22-2013', NULL)
	,(9, 4, '12-28-2018', '7-17-2020')
	,(10, 9, '1-26-2012', '2-15-2020')
	,(4, 3, '11-22-2012', '3-14-2020')
	,(4, 7, '12-28-2012', '5-16-2012')
	,(7, 4, '4-2-2012', '6-18-2012')
	,(7, 11, '7-23-2012', NULL)
	,(6, 5, '9-22-2012', '7-13-2012')
	,(4, 8, '10-21-2012', '8-12-2012')
	;

select * 
from disk

----- create a query
SELECT borrower_id as Borrower_id, disk_id as Disk_id, CAST
		( borrowed_date as date) as Borrowed_date, returned_date as Return_date
FROM disk_has_borrower
WHERE returned_date IS NULL;


--Start of Project 4
--1.
SELECT 'Disk Name'=disk_name, release_date, 
	disk_type.description, genre.description,
		status.description     ---check column names & format
FROM Disk
JOIN disk_type
	ON disk.disk_type_id = disk_type.disk_type_id
JOIN genre
	ON disk.genre_id = genre.genre_id
JOIN status	
	ON disk.status_id = status.status_id
ORDER BY disk_name
;

---2.
SELECT lname, fname, disk_name, borrowed_date, 
	returned_date  --check names
FROM disk_has_borrower
JOIN Borrower
	ON disk_has_borrower.borrower_id = borrower.borrower_id
JOIN disk
	ON disk_has_borrower.disk_id = disk.disk_id
ORDER BY lname
;

--3.
SELECT disk_name,count(*)
FROM disk_has_borrower
JOIN disk
	ON disk_has_borrower.disk_id = disk.disk_id
GROUP BY disk_name
HAVING COUNT(*) > 1
ORDER BY disk_name
;

--4.
SELECT disk_name, borrowed_date, returned_date, lname,
	fname
FROM disk
JOIN disk_has_borrower
	ON disk.disk_id = disk_has_borrower.disk_id
JOIN borrower
	ON borrower.borrower_id = disk_has_borrower.borrower_id
WHERE returned_date IS NULL
ORDER BY disk_name
;
go
--5.
CREATE VIEW View_Borrower_No_Loans
AS
	SELECT borrower_id, lname, fname
	FROM borrower
	WHERE borrower_id NOT IN
		(SELECT DISTINCT borrower_id
		FROM disk_has_borrower)
;
go
SELECT lname, fname --- check column names
FROM View_Borrower_No_Loans
ORDER BY lname, fname
;

--6.
SELECT lname, fname, COUNT(disk_id)  --- check column names
FROM disk_has_borrower
JOIN borrower
	ON borrower.borrower_id = 
	disk_has_borrower.borrower_id
GROUP BY lname, fname
HAVING COUNT(*) > 1
ORDER BY lname, fname
;
