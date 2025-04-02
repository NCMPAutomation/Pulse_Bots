# Import necessary libraries
import pandas as pd

# Load the data
data = pd.read_csv('data.csv')

# Transform the data (e.g., convert to uppercase)
data['column_name'] = data['column_name'].str.upper()

# Save the transformed data to a new CSV file
data.to_csv('transformed_data.csv', index=False)