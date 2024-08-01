--12
SELECT
	CountryName AS 'Contry Name',
	IsoCode AS 'ISO Code'
FROM Countries
WHERE LEN(CountryName) - LEN(REPLACE(LOWER(CountryName), 'a', '')) >= 3
ORDER BY IsoCode

--13
SELECT 
	p.PeakName,
	r.RiverName,
	CONCAT(LOWER(LEFT(p.PeakName, LEN(p.PeakName) - 1)), LOWER(r.RiverName)) AS 'Mix'
FROM Peaks AS p, Rivers AS r
WHERE RIGHT(p.PeakName, 1) = LEFT(r.RiverName, 1)
ORDER BY Mix
