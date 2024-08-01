--01
SELECT * FROM Departments

--02
SELECT [Name] FROM Departments

--03
SELECT FirstName, LastName, Salary FROM Employees

--04
SELECT FirstName, MiddleName, LastName FROM Employees

--05
SELECT CONCAT(FirstName, '.', LastName, '@softuni.bg') AS [Full Email Address] FROM Employees

--06
SELECT DISTINCT Salary FROM Employees
	
--07
SELECT * FROM Employees WHERE JobTitle = 'Sales Representative'

--08
SELECT FirstName, LastName, JobTitle FROM Employees WHERE Salary >= 20000 AND Salary <= 30000

--09
SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName) FROM Employees 
WHERE Salary = 25000 OR Salary = 14000 OR Salary = 12500 OR Salary = 23600

--10
SELECT FirstName, LastName FROM Employees WHERE ManagerID IS NULL

--11
SELECT FirstName, LastName, Salary FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC

--12
SELECT TOP(5) FirstName, LastName FROM Employees
ORDER BY Salary DESC

--13
SELECT FirstName, LastName FROM Employees
WHERE DepartmentID <> 4

--14
SELECT * FROM Employees
ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName

--15
CREATE VIEW V_EmployeesSalaries AS SELECT FirstName, LastName, Salary FROM Employees
--SELECT * FROM V_EmployeesSalaries

--16
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS [Full Name]
		,JobTitle 
FROM Employees
--SELECT * FROM V_EmployeeNameJobTitle

--17
SELECT DISTINCT JobTitle FROM Employees

--18
SELECT TOP(10) * FROM Projects ORDER BY StartDate, [Name]

--19
SELECT TOP(7) FirstName, LastName,  HireDate FROM Employees ORDER BY HireDate DESC

BEGIN TRANSACTION 

UPDATE Employees
SET Salary = Salary * 1.12 
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.[Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
SELECT Salary FROM Employees

ROLLBACK TRANSACTION