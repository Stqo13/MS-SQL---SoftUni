--01
SELECT TOP(5)
	e.EmployeeID,
	e.JobTitle,
	a.AddressID,
	a.AddressText
FROM Employees AS e JOIN Addresses AS a ON e.AddressID = a.AddressID
ORDER BY a.AddressID ASC

--02
SELECT TOP(50) 
		e.FirstName,
		e.LastName,
		t.[Name],
		a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON t.TownID = a.TownID
ORDER BY e.FirstName, e.LastName

--03
SELECT
	e.EmployeeID,
	e.FirstName,
	e.LastName,
	d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID = 3
ORDER BY e.EmployeeID

--04
SELECT TOP(5) 
	e.EmployeeID,
	e.FirstName,
	e.Salary,
	d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY d.DepartmentID

--05
SELECT TOP(3)
	e.EmployeeID,
	e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL
ORDER BY e.EmployeeID

--06
SELECT 
	e.FirstName,
	e.LastName,
	e.HireDate,
	d.[Name] AS DeptName
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1.1.1991' AND d.[Name] IN ('Sales', 'Finance')
ORDER BY HireDate

--07
SELECT TOP(5)
	e.EmployeeID,
	e.FirstName,
	p.[Name] AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects AS p ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '2002-08-13' --AND p.EndDate IS NULL
ORDER BY EmployeeID

--08
SELECT 
	e.EmployeeID,
	e.FirstName,
	p.[Name] AS ProjectName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects AS p ON ep.ProjectID = p.ProjectID AND YEAR(p.StartDate) < '2005'
WHERE e.EmployeeID = 24

	--CASE 
 --       WHEN p.StartDate >= '2005' THEN NULL
 --       ELSE p.[Name]
 --   END AS ProjectName

--09
SELECT 
	e.EmployeeID,
	e.FirstName,
	m.EmployeeID,
	m.FirstName
FROM Employees AS e
JOIN Employees AS m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN(3, 7)
ORDER BY e.EmployeeID ASC

--10
SELECT TOP(50)
	e.EmployeeID,
	CONCAT_WS(' ', e.FirstName, e.LastName) AS EmployeeName,
	CONCAT_WS(' ', m.FirstName, m.LastName) AS ManagerName,
	d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Employees AS m ON e.ManagerID = m.EmployeeID
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID

--11
SELECT 
	MIN(ad.AvgSalary) AS MinAverageSalary
FROM 
(
	SELECT 
		AVG(Salary) AS AvgSalary 
	FROM Employees AS e
	GROUP BY e.DepartmentID
) AS ad