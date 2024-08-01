--13
SELECT 
	e.DepartmentID,
	SUM(e.Salary)
FROM Employees AS e
GROUP BY DepartmentID
ORDER BY DepartmentID

--14
SELECT 
	e.DepartmentID,
	MIN(Salary)
FROM Employees AS e
WHERE e.HireDate > '01-01-2000'
GROUP BY e.DepartmentID
HAVING e.DepartmentID IN (2, 5, 7)

--15
SELECT * INTO RichEmployees
FROM Employees AS e
WHERE e.Salary > 30000

DELETE
FROM RichEmployees
WHERE ManagerID = 42

UPDATE RichEmployees
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT
	r.DepartmentID,
	AVG(r.Salary)
FROM RichEmployees AS r
GROUP BY r.DepartmentID

--16
SELECT
	e.DepartmentID,
	MAX(e.Salary)
FROM Employees AS e
GROUP BY e.DepartmentID
HAVING MAX(e.Salary) NOT BETWEEN 30000 AND 70000

--17
SELECT
	COUNT(e.EmployeeID) AS [Count]
FROM Employees AS e
GROUP BY e.ManagerID
HAVING e.ManagerID IS NULL