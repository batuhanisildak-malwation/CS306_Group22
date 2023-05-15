import pandas as pd
import geopandas as gpd
import mysql.connector
import matplotlib.pyplot as plt

# Read the data into a pandas DataFrame
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="example",
  database="test-db"
)

query = """SELECT C.isoCode AS 'Country', SUM(D.count) AS 'Deaths' FROM Death D
INNER JOIN Country C ON C.id = D.countryID
GROUP BY D.countryId;"""

df = pd.read_sql(query, mydb)

# world is a GeoDataFrame object
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))
world = world[world.name != "Antarctica"]
world = world[world.name != "Fr. S. Antarctic Lands"]

Deaths = {}
for country in world.iso_a3:
    Deaths[country] = df[df["Country"] == country]["Deaths"].mean()

world["Deaths"] = world.iso_a3.map(Deaths)

fig, ax = plt.subplots(figsize=(20, 5))
world.plot(column="Deaths", cmap="Spectral", legend=True, ax=ax, missing_kwds={"color": "lightgrey"})
ax.set_xticks([])
ax.set_yticks([])
ax.set_frame_on(False)

plt.savefig('figures/GetCountryTotalDeathByYear.png')

plt.show()
