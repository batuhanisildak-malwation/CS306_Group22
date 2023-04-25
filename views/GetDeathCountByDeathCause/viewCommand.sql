create view GetDeathCountByDeathCause as
SELECT DC.name AS 'Death Cause', SUM(D.count) AS 'Total Death' FROM Death D
JOIN DeathCause DC on DC.id = D.deathCauseId
GROUP BY D.deathCauseId
ORDER BY 2 DESC