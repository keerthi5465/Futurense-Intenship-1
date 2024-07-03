import pandas as pd


df = pd.read_csv("Futurense-Intenship-1\Python\zomato.zomato.csv")


print(df.isnull().sum())


df_dropna = df.dropna()
print(df_dropna)


df_fillna = df.fillna('Unknown')
print(df_fillna)


df['Average Cost for two'] = df['Average Cost for two'].fillna(df['Average Cost for two'].mean())
df['City'] = df['City'].fillna(df['City'].mode()[0])
print(df)


df_interpolate = df.interpolate()
print(df_interpolate)

df_drop_columns = df.dropna(axis=1)
print(df_drop_columns)

import seaborn as sns
import matplotlib.pyplot as plt

plt.figure(figsize=(12, 8))
sns.heatmap(df.isnull(), cbar=False, cmap='viridis')
plt.title('Heatmap of Missing Values')
plt.show()
plt.figure(figsize=(12, 8))
sns.heatmap(df.isnull(), cbar=False, cmap='viridis')
plt.title('Heatmap of Missing Values After Handling')
plt.show()

df3 = df.fillna(method='pad')
df5 = df.fillna(method='pad',axis=1)
df5


df['Average Cost for two'] = df['Average Cost for two'].fillna(df['Average Cost for two'].sum())
print(df)

from sklearn.impute import SimpleImputer
num_cols = df.select_dtypes(include=['float64', 'int64']).columns
num_imputer = SimpleImputer(strategy='mean')
df[num_cols] = num_imputer.fit_transform(df[num_cols])
cat_cols = df.select_dtypes(include=['object']).columns
cat_imputer = SimpleImputer(strategy='most_frequent')
df[cat_cols] = cat_imputer.fit_transform(df[cat_cols])
plt.figure(figsize=(12, 8))
sns.heatmap(df.isnull(), cbar=False, cmap='viridis')
plt.title('Heatmap of Missing Values After Handling')
plt.show()