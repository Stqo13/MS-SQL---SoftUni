CREATE DATABASE Movies


CREATE TABLE Directors
(
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	DirectorName NVARCHAR(200) NOT NULL,
	Notes NVARCHAR(MAX) 
)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	GenreName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	CategoryName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies
(
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	Title NVARCHAR(100) NOT NULL,
	DirectorId INT NOT NULL FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear DATETIME2 NOT NULL,
	[Length] INT NOT NULL,
	GenreId INT NOT NULL FOREIGN KEY REFERENCES Genres(Id),
    CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id),
    Rating NVARCHAR(5),
    Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes) VALUES
('Steven Spielberg', 'Known for Jurassic Park, Jaws, E.T.'),
('Christopher Nolan', 'Known for Inception, The Dark Knight Trilogy'),
('Quentin Tarantino', 'Known for Pulp Fiction, Kill Bill'),
('Martin Scorsese', 'Known for Goodfellas, The Wolf of Wall Street'),
('James Cameron', 'Known for Titanic, Avatar');

INSERT INTO Genres (GenreName, Notes) VALUES
('Action', 'Fast-paced, high energy'),
('Drama', 'Character-driven, emotional stories'),
('Comedy', 'Humorous content, meant to entertain'),
('Thriller', 'Suspenseful, tense'),
('Science Fiction', 'Futuristic, speculative technology');

INSERT INTO Categories (CategoryName, Notes) VALUES
('Feature Film', 'Full-length film'),
('Short Film', 'Brief film, typically less than 40 minutes'),
('Documentary', 'Non-fictional, informative'),
('Animation', 'Animated films, including 2D and 3D'),
('Independent', 'Produced outside major studio systems');

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes) VALUES
('Inception', 2, '2010-01-01', 148, 5, 1, 'PG-13', 'Mind-bending thriller'),
('Titanic', 5, '1997-01-01', 195, 2, 1, 'PG-13', 'Epic romance and disaster'),
('Pulp Fiction', 3, '1994-01-01', 154, 2, 1, 'R', 'Non-linear storyline'),
('Jurassic Park', 1, '1993-01-01', 127, 1, 4, 'PG-13', 'Dinosaurs brought to life'),
('The Wolf of Wall Street', 4, '2013-01-01', 180, 2, 1, 'R', 'Based on true story of Jordan Belfort');
