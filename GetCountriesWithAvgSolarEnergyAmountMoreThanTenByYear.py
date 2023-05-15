import mysql.connector
import plotly.graph_objects as go

# Connect to MySQL database and execute the SQL query
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="example",
    database="test-db"
)

query = """
SELECT COUNT(*) as CountryCount FROM Country C
WHERE C.Id IN (
    SELECT SubQ.countryId
    FROM (
        SELECT AVG(amount) AS AverageAmount, countryId
        FROM CountryRenewableEnergySource CRES
        WHERE CRES.renewableEnergySourceId = 2
        GROUP BY CRES.countryId
    ) AS SubQ
    WHERE SubQ.AverageAmount > 10
)
"""

cursor = mydb.cursor()
cursor.execute(query)
country_count = cursor.fetchone()[0]

# Create the gauge chart using Plotly
fig = go.Figure(go.Indicator(
    mode="gauge+number",
    value=country_count,
    domain={'x': [0, 1], 'y': [0, 1]},
    gauge={'axis': {'range': [0, 203]},
           'bar': {'color': 'red'},
           'steps': [{'range': [0, country_count * 0.5], 'color': 'lightgray'},
                     {'range': [country_count * 0.5, country_count], 'color': 'gray'}],
           'threshold': {'line': {'color': 'black', 'width': 2}, 'thickness': 0.75, 'value': country_count}}))

fig.update_layout(title='Gauge Chart: Country Count', width=400, height=300)
fig.write_image('figures/GetCountriesWithAvgSolarEnergyAmountMoreThanTenByYear.png')
fig.show()
