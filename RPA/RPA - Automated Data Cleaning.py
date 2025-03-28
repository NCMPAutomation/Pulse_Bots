# Import necessary libraries
import pandas as pd

# Load the data
data = pd.read_csv('data.csv')

# Remove rows with missing values
cleaned_data = data.dropna()

# Save the cleaned data to a new CSV file
cleaned_data.to_csv('cleaned_data.csv', index=False)