import pandas as pd
data = pd.read_csv("Futurense-Intenship-1\Python\zomato.zomato.csv")
df = pd.DataFrame(data)

print(df)

data2 = pd.DataFrame(data1)
data2

makati_restaurants = df[df["City"] == "Makati City"]
print(makati_restaurants)

average_cost_per_city = df.groupby("City")["Average Cost for two"].mean()
print(average_cost_per_city)

high_rated_restaurants = df[df["Aggregate rating"] >= 4.5]
print(high_rated_restaurants)

table_booking_count = df[df["Has Table booking"] == "Yes"].shape[0]
print(table_booking_count)

unique_cuisines = df["Cuisines"].str.split(", ").explode().unique()
print(unique_cuisines)

japanese_cuisine = df[df['Cuisines'].str.contains('Japanese', case=False)]
print("Restaurants serving Japanese cuisine:\n", japanese_cuisine)

no_table_booking = df[df['Has Table booking'] == 'No']
print("Restaurants without table booking:\n", no_table_booking)
