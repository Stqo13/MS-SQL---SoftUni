--01
CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
BEGIN 
	SELECT 
		FirstName,
		LastName
	FROM Employees
	WHERE Salary > 35000
END

EXEC dbo.usp_GetEmployeesSalaryAbove35000

--02
CREATE PROC usp_GetEmployeesSalaryAboveNumber
	@number DECIMAL(18, 4)
AS
BEGIN
	SELECT 
		FirstName,
		LastName
	FROM Employees
	WHERE Salary >= @number
END

EXEC dbo.ups_GetEmployeesSalaryAboveNumber 48100

--03
CREATE OR ALTER PROC usp_GetTownsStartingWith
	@input NCHAR(50)
AS
BEGIN
	SELECT 
		[Name] AS Town
	FROM Towns
	WHERE LEFT([Name], LEN(@input)) = @input
END

EXEC dbo.usp_GetTownsStartingWith 'b'

--04
CREATE PROC usp_GetEmployeesFromTown
	@townName NVARCHAR(50)
AS
BEGIN
	SELECT 
		FirstName,
		LastName
	FROM Employees AS e
	JOIN Addresses AS a ON e.AddressID = a.AddressID
	JOIN Towns AS t ON a.TownID = t.TownID
	WHERE t.[Name] = @townName
END

EXEC dbo.usp_GetEmployeesFromTown 'Sofia'

--05
CREATE FUNCTION ufn_GetSalaryLevel(@salaryLevel DECIMAL(18, 4))
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @result NVARCHAR(10)
		
	IF(@salaryLevel < 30000)
	BEGIN
		SET @result = 'Low'
	END
	ELSE IF(@salaryLevel BETWEEN 30000 AND 50000)
	BEGIN
		SET @result = 'Average'
	END
	ELSE IF (@salaryLevel > 50000)
	BEGIN
		SET @result = 'High'
	END

	RETURN @result
END

SELECT 
	Salary,
	dbo.ufn_GetSalaryLevel(Salary) AS 'Salary Level'
FROM Employees

--06
CREATE PROC usp_EmployeesBySalaryLevel
	@salaryLevel NVARCHAR(10)
AS
BEGIN
	SELECT 
		FirstName,
		LastName
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryLevel
END

EXEC dbo.usp_EmployeesBySalaryLevel 'High'

--07
CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(50), @word NVARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @index INT = 1;
	WHILE(@index <= LEN(@word))
	BEGIN
		DECLARE @currentChar CHAR = SUBSTRING(@word, @index, 1)
		IF(CHARINDEX(@currentChar, @setOfLetters) = 0)
		BEGIN
			RETURN 0
		END

		SET @index += 1
	END

	RETURN 1
END

SELECT 
	'oistmiahf' AS SetOfLetters,
	'Sofia' AS Word,
	dbo.ufn_IsWordComprised('oistmiahf', 'Sofia') AS Result