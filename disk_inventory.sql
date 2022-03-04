--/***********************************************************/
--/* Date			Programmer		Description		*/
--/*
--/* 3/4/2022		kjones			Initial creation of disk */
--/*								database				  */
--/*															*/
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