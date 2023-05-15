import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="example",
  database="test-db"
)

mycursor = mydb.cursor()

mycursor.execute("""select `C`.`name` AS `Country Name`, `P`.`amount` AS `Amount`, `P`.`amountUnit` AS `Amount Unit`, `Y`.`value` AS `Year`
from ((`test-db`.`Pollution` `P` join `test-db`.`Country` `C` on ((`P`.`countryId` = `C`.`id`))) join `test-db`.`Year` `Y` on ((`P`.`yearId` = `Y`.`id`)))
where (`P`.`type` = 'Air Pollution') AND `C`.`name` = 'Turkey'""")

myresult = mycursor.fetchall()
df = pd.DataFrame(myresult, columns=['Country Name', 'Amount', 'Amount Unit', 'Year'])

plt.pie(df['Amount'], labels=df['Year'], autopct='%1.1f%%')
plt.title('Pie Chart')
plt.axis('equal')

plt.savefig('figures/GetCountryAirPollutionByYear.png')

plt.show()
