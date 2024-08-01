--01
SELECT 
	COUNT(w.Id) AS [Count]
FROM WizzardDeposits as w

--02
SELECT 
	MAX(w.MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits AS w

--03
SELECT 
	w.DepositGroup,
	MAX(w.MagicWandSize)
FROM WizzardDeposits AS w 
GROUP BY w.DepositGroup

--04
SELECT TOP(2)
	w.DepositGroup
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup
ORDER BY AVG(w.MagicWandSize)

--05
SELECT 
	w.DepositGroup,
	SUM(w.DepositAmount) AS TotalSum
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

--06
SELECT 
	w.DepositGroup,
	SUM(w.DepositAmount) AS TotalSum
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup

--07
SELECT 
	w.DepositGroup,
	SUM(w.DepositAmount) AS TotalSum
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup
HAVING SUM(w.DepositAmount) < 150000
ORDER BY TotalSum DESC

--08
SELECT 
	w.DepositGroup,
	w.MagicWandCreator,
	MIN(w.DepositCharge) AS MinDepositCharge
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup, w.MagicWandCreator, w.DepositCharge
ORDER BY w.MagicWandCreator, w.DepositGroup

--09
SELECT 
	AgeGroup,
	COUNT(*) AS WizardCount
FROM
(
	SELECT 
	CASE
		WHEN w.Age BETWEEN 0 AND 10 THEN '[0-10]'
		WHEN w.Age BETWEEN 11 AND 20 THEN '[11-20]'
		WHEN w.Age BETWEEN 21 AND 30 THEN '[21-30]'
		WHEN w.Age BETWEEN 31 AND 40 THEN '[31-40]'
		WHEN w.Age BETWEEN 41 AND 50 THEN '[41-50]'
		WHEN w.Age BETWEEN 51 AND 60 THEN '[51-60]'
		ELSE '[61+]'
		END
		AS AgeGroup 
		FROM WizzardDeposits AS w
) AS AgeGroup
GROUP BY AgeGroup

--10
SELECT 
	LEFT(w.FirstName, 1) AS FirstLetter
FROM WizzardDeposits AS w
GROUP BY DepositGroup, w.FirstName
HAVING DepositGroup = 'Troll Chest'

--11
SELECT
	w.DepositGroup,
	w.IsDepositExpired,
	AVG(w.DepositInterest)
FROM WizzardDeposits AS w
WHERE w.DepositStartDate > '01-01-1985'
GROUP BY w.DepositGroup, w.IsDepositExpired
ORDER BY w.DepositGroup DESC, w.IsDepositExpired

--12
--LEAD()OVER usage DON'T KNOW