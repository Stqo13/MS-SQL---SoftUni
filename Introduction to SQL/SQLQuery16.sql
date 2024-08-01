CREATE DATABASE SoftUni

CREATE TABLE Towns
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(100) NOT NULL
)

CREATE TABLE Addresses
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	AddressText NVARCHAR(MAX) NOT NULL,
	TownId INT FOREIGN KEY REFERENCES Towns(Id)
)


CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(100) NOT NULL
)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50) NOT NULL,
	JobTitle NVARCHAR(100) NOT NULL,
	DepartmentId INT FOREIGN KEY REFERENCES Departments(Id),
	HireDate DATETIME2,
	Salary DECIMAL(10, 2) NOT NULL,
	AddressId INT FOREIGN KEY REFERENCES Addresses(Id)
)

INSERT INTO Towns ([Name])
	VALUES('Sofia'),
			('Varna'),
			('Plovdiv'),
			('Burgas')

INSERT INTO Departments ([Name])
	VALUES('Software Development'),
			('Engineering'),
			('Quality Assurance'),
			('Sales'),
			('Marketing')

INSERT INTO Addresses (AddressText, TownId)
	VALUES('123 Main St', 2),
			('456 Oak St', 4),
			('789 Pine St', 1),
			('101 Maple St', 3)

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
	VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 1, '2013-02-01 00:00:00', 3500.00),
			('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 2, '2004-03-02 00:00:00', 4000.00),
			('Maria', 'Petrova', 'Ivanova', 'Intern', 3, '2016-08-28 00:00:00', 525.25),
			('Georgi', 'Teziev', 'Ivanov', 'CEO', 4, '2007-12-09 00:00:00', 3000.00),
			('Peter', 'Pan', 'Pan', 'Intern', 5, '2016-08-28 00:00:00', 599.88)

SELECT [Name] FROM Towns
ORDER BY [Name] ASC

SELECT [Name] FROM Departments
ORDER BY [Name] ASC

SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary DESC

UPDATE Employees
SET Salary = Salary * 1.1
SELECT Salary FROM Employees