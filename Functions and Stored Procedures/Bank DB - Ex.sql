--09
CREATE PROC usp_GetHoldersFullName
AS
BEGIN
	SELECT 
		CONCAT_WS(' ', FirstName, LastName) AS 'Full Name'	
	FROM AccountHolders
END

EXEC dbo.usp_GetHoldersFullName

--10
CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan
	@number DECIMAL(18, 4)
AS
BEGIN
	SELECT 
		ah.FirstName,
		ah.LastName
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	GROUP BY ah.FirstName, ah.LastName
	HAVING SUM(a.Balance) > @number
	ORDER BY ah.FirstName, ah.LastName
END

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 50000

--11
CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(18, 4), @interestRate FLOAT, @years INT)
RETURNS DECIMAL(18, 4)
AS
BEGIN
	DECLARE @futureValue DECIMAL(18, 4)
	DECLARE @newYearlyRate FLOAT = 1 + @interestRate

	SET @futureValue = @sum * POWER(@newYearlyRate, @years)

	RETURN @futureValue
END

SELECT dbo.ufn_CalculateFutureValue (1000, 0.1, 5) AS 'Future Value'

--12
CREATE OR ALTER PROC usp_CalculateFutureValueForAccount(@accountId INT, @interestRate FLOAT)
AS
BEGIN
	SELECT TOP(1)
		ah.Id AS 'Account Id',
		ah.FirstName AS 'First Name',
		ah.LastName AS 'Last Name',
		a.Balance AS 'Current Balance',
		dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, 5) AS 'Balance in 5 years'
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	WHERE ah.Id = @accountId
END

EXEC usp_CalculateFutureValueForAccount 1, 0.1