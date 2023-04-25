create view GetCountryTotalDeathByYear as
SELECT C.name AS 'Country', SUM(D.count) AS 'Total Death' FROM Death D
INNER JOIN Country C ON C.id = D.countryID
GROUP BY D.countryId;