SELECT COUNT(*) AS CountryCount FROM Country C
WHERE EXISTS (SELECT SubQ.countryId FROM (SELECT AVG(amount) AS AverageAmount, countryId FROM CountryRenewableEnergySource CRES
WHERE CRES.renewableEnergySourceId = 2 AND C.Id = CRES.countryId
GROUP BY CRES.countryId
HAVING AverageAmount > 10
) AS SubQ)