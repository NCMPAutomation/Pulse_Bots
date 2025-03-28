# Import necessary libraries
import pandas as pd

# Load the data
data = pd.read_csv('data.csv')

# Define validation rules
def validate_row(row):
    if row['age'] < 0 or row['age'] > 120:
        return False
    if not row['email'].count('@') == 1:
        return False
    return True

# Apply validation rules to each row
valid_data = data[data.apply(validate_row, axis=1)]

# Save the valid data to a new CSV file
valid_data.to_csv('valid_data.csv', index=False)