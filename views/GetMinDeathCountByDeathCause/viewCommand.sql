create view GetMinDeathCountByDeathCause as
Select * from (SELECT DC.name AS 'Death Cause', SUM(D.count) AS 'Total Death' FROM Death D
JOIN DeathCause DC on DC.id = D.deathCauseId
GROUP BY D.deathCauseId
ORDER BY 2 DESC) as subq where subq.`Total Death`=(SELECT  MIN(`Total Death`) as cnt  FROM
(SELECT DC.name AS 'Death Cause', SUM(D.count) AS 'Total Death' FROM Death D
JOIN DeathCause DC on DC.id = D.deathCauseId
GROUP BY D.deathCauseId
ORDER BY 2 DESC) as SubQ);