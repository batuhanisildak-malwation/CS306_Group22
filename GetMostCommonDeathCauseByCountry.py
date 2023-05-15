import mysql.connector
import pandas as pd
import geopandas as gpd
import seaborn as sns
import matplotlib.pyplot as plt

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="example",
  database="test-db"
)

mycursor = mydb.cursor()

mycursor.execute("""SELECT SQ.Country AS 'Country',
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
)
AND SQ.Cause = 'High systolic blood pressure'
ORDER BY Country ASC""")

myresult = mycursor.fetchall()
print(type(myresult))

df = pd.DataFrame(myresult, columns=['country', 'cause', 'value'])

sns.lineplot(x='country', y='value', data=df)

plt.title('Value by Country over Time')

plt.xticks(rotation=60)

plt.savefig('figures/GetMostCommonDeathCauseByCountry.png')