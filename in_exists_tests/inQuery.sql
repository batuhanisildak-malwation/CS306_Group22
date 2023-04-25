SELECT COUNT(*) as CountryCount FROM Country C
WHERE C.Id IN (SELECT SubQ.countryId FROM (SELECT AVG(amount) AS AverageAmount, countryId FROM CountryRenewableEnergySource CRES
WHERE CRES.renewableEnergySourceId = 2
GROUP BY CRES.countryId) AS SubQ WHERE SubQ.AverageAmount > 10
);