create view GetMostCommonDeathCauseByCountry as
SELECT SQ.Country AS 'Country',
       SQ.Cause AS 'Cause',
       MAX(SQ.Count) AS 'Max Count'
FROM (
    SELECT C.name AS 'Country',
           DC.name AS 'Cause',
           SUM(D.count) AS 'Count'
    FROM Death D
    INNER JOIN DeathCause DC ON D.deathCauseId = DC.id
    INNER JOIN Country C ON D.countryId = C.id
    GROUP BY C.name, DC.name
) AS SQ
GROUP BY SQ.Country, SQ.Cause
HAVING MAX(SQ.Count) = (
    SELECT MAX(SQ2.Count)
    FROM (
        SELECT C.name AS 'Country',
               DC.name AS 'Cause',
               SUM(D.count) AS 'Count'
        FROM Death D
        INNER JOIN DeathCause DC ON D.deathCauseId = DC.id
        INNER JOIN Country C ON D.countryId = C.id
        GROUP BY C.name, DC.name
    ) AS SQ2
    WHERE SQ2.Country = SQ.Country
) ORDER BY Country ASC;

