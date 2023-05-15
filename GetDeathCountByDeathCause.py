import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="example",
  database="test-db"
)

mycursor = mydb.cursor()

mycursor.execute("""SELECT DC.name AS 'Death Cause', SUM(D.count) AS 'Total Death' FROM Death D
JOIN DeathCause DC on DC.id = D.deathCauseId
GROUP BY D.deathCauseId
ORDER BY 2 DESC""")
                 
myresult = mycursor.fetchall()

df = pd.DataFrame(myresult, columns=['Death Cause', 'Total Death'])

sns.barplot(x='Death Cause', y='Total Death', data=df)

plt.title('Total Death by Cause')

plt.xticks(rotation=90)

plt.savefig('figures/GetDeathCountByDeathCause.png')

plt.show()
