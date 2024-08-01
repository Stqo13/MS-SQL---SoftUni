CREATE TABLE Passports
(
	Id INT PRIMARY KEY,
	PassportNumber NVARCHAR(20)
)

CREATE TABLE Persons
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL,
	PassportID INT FOREIGN KEY REFERENCES Passports(Id)
)

INSERT INTO Passports (Id, PassportNumber)
	VALUES(101, 'N34FG21B'),
		  (102, 'K65LO4R7'),
		  (103, 'ZE657QP2')

INSERT INTO Persons (FirstName, Salary, PassportID)
	VALUES('Roberto', 43300.00, 102),
		  ('Tom', 56100.00, 103),
		  ('Yana', 60200.00, 101)
