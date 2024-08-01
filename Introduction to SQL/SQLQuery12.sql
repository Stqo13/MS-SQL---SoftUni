CREATE DATABASE Minions

CREATE TABLE Minions
(
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50),
	Age INT
)

CREATE TABLE Towns
(
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50)
)

ALTER TABLE Minions
ADD TownId INT

ALTER TABLE Minions
ADD FOREIGN KEY(TownId) REFERENCES Towns(Id)

INSERT INTO Towns
	(Id, [Name])
	VALUES (1, 'Sofia'),
		   (2, 'Plovdiv'),
		   (3, 'Varna')

INSERT INTO Minions
	(Id, [Name], Age, TownId)
VALUES(1, 'Kevin', 22, 1),
	  (2, 'Bob', 15, 3),
	  (3, 'Steward', NULL, 2)

TRUNCATE TABLE Minions

DROP TABLE Minions
DROP TABLE Towns

CREATE TABLE People
(
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	Height DECIMAL(5, 2),
	[Weight] DECIMAL(5, 2),
	Gender CHAR(1) NOT NULL,
		CHECK(Gender in ('m', 'f')),
	Birthdate DATETIME2 NOT NULL,
	Biography  NVARCHAR(MAX)
)

INSERT INTO People
	([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
	VALUES('Stefan Milenov Dimitrov', NULL, 190, 61.7, 'm', '2007-06-13', 'Hello i am Stefko and I like programming very much but sometimes I get a little annoyed'),
		  ('Aleks Ivaylov Stefanov', NULL, 190, 76.9, 'm', '2007-05-16', 'Guten Morgen'),
		  ('Stilyan Ivanov Chanev', NULL, 168, 80.4, 'm', '2007-10-21', 'Glavata mi e peralnq'),
		  ('Teodora Nedkova Nedkova', NULL, 160, 56.0, 'f', '2007-12-13', 'Koleva e typa'),
		  ('Hristo Bratcheto Denev', NULL, 167, 75.4, 'm', '2007-07-23', 'Pod kapaka bqgat chetiristotin kone pone')

CREATE TABLE Users
(
	Id BIGINT PRIMARY KEY NOT NULL IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLogInTime DATETIME2,
	IsDeleted BIT
)

INSERT INTO Users
	(Username, [Password])
	VALUES('Stqo', 'Randompass:123'),
		  ('Stelko122', 'Peralnq453'),
		  ('RLGalex', 'Soletka666'),
		  ('PontitoWe', 'Tolonka0625'),
		  ('FoodTedi', 'Foodpandaold123')

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07BEB88671

ALTER TABLE Users
ADD CONSTRAINT PK_UsernameID PRIMARY KEY(Id, Username)

ALTER TABLE Users
ADD CONSTRAINT CHK_PasswordCheck CHECK(LEN([Password]) >= 5)

ALTER TABLE Users
ADD CONSTRAINT LastTimeLogInDefault
DEFAULT GETDATE() FOR LastLogInTime

ALTER TABLE Users
DROP CONSTRAINT PK_UsernameID

ALTER TABLE Users
ADD CONSTRAINT PK_UserID PRIMARY KEY(Id)

ALTER TABLE Users
ADD CONSTRAINT CHK_UniqueUsername CHECK(LEN([Password]) >= 3)

