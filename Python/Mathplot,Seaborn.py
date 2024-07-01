import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('Futurense-Intenship-1\Python\zomato.csv')


plt.figure(figsize=(10, 6))
sns.countplot(data=df, x='City', palette='viridis')
plt.title('Number of Restaurants in Each City')
plt.xticks(rotation=45)
plt.xlabel('City')
plt.ylabel('Number of Restaurants')
plt.show()
plt.figure(figsize=(10, 6))
sns.histplot(df['Aggregate rating'], bins=10, kde=True, color='blue')
plt.title('Distribution of Aggregate Ratings')
plt.xlabel('Aggregate Rating')
plt.ylabel('Frequency')
plt.show()
plt.figure(figsize=(10, 6))
sns.boxplot(data=df, x='City', y='Average Cost for two', palette='Set2')
plt.title('Average Cost for Two by City')
plt.xticks(rotation=45)
plt.xlabel('City')
plt.ylabel('Average Cost for Two (in Botswana Pula)')
plt.show()


plt.figure(figsize=(10, 6))
scatter = plt.scatter(df['Longitude'], df['Latitude'], c=df['Aggregate rating'], cmap='coolwarm', s=100, edgecolor='k', alpha=0.7)
plt.colorbar(scatter, label='Aggregate Rating')
plt.title('Geographical Distribution of Restaurants with Ratings')
plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.show()
plt.figure(figsize=(10, 6))
sns.countplot(data=df, x='Price range', palette='cool')
plt.title('Count of Restaurants by Price Range')
plt.xlabel('Price Range')
plt.ylabel('Count')
plt.show()



plt.figure(figsize=(8, 8))
table_booking_counts = df['Has Table booking'].value_counts()
plt.pie(table_booking_counts, labels=table_booking_counts.index, autopct='%1.1f%%', colors=['skyblue', 'lightcoral'], startangle=140)
plt.title('Percentage of Restaurants Offering Table Booking')
plt.show()


pivot_table = df.pivot_table(values='Average Cost for two', index='City', columns='Price range', aggfunc='mean')
plt.figure(figsize=(12, 8))
sns.heatmap(pivot_table, annot=True, cmap='YlGnBu', fmt='.1f')
plt.title('Heatmap of Average Cost for Two by City and Price Range')
plt.xlabel('Price Range')
plt.ylabel('City')
plt.show()


plt.figure(figsize=(14, 8))
cuisine_data = df.explode('Cuisines')
sns.violinplot(data=cuisine_data, x='Cuisines', y='Average Cost for two', palette='muted')
plt.title('Violin Plot of Average Cost for Two by Cuisine Type')
plt.xticks(rotation=90)
plt.xlabel('Cuisine Type')
plt.ylabel('Average Cost for Two (in Botswana Pula)')
plt.show()


g = sns.FacetGrid(cuisine_data, col='City', col_wrap=3, height=4)
g.map(sns.histplot, 'Aggregate rating', bins=10, kde=True, color='m')
g.add_legend()
plt.show()


plt.figure(figsize=(10, 6))
sns.barplot(data=df, x='Rating text', y='Votes', estimator=sum, ci=None, palette='coolwarm')
plt.title('Total Votes by Rating Text')
plt.xlabel('Rating Text')
plt.ylabel('Total Votes')
plt.show()