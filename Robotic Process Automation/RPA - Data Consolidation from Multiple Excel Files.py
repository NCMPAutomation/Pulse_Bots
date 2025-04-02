# Import necessary libraries
import pandas as pd
import os

# Define the directory containing the Excel files
directory = '/path/to/excel/files'

# Initialize an empty DataFrame
consolidated_data = pd.DataFrame()

# Read each Excel file and append its data to the DataFrame
for filename in os.listdir(directory):
    if filename.endswith('.xlsx'):
        file_path = os.path.join(directory, filename)
        data = pd.read_excel(file_path)
        consolidated_data = consolidated_data.append(data, ignore_index=True)

# Save the consolidated data to a new Excel file
consolidated_data.to_excel('consolidated_data.xlsx', index=False)