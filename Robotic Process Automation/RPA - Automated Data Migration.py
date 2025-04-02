# Import necessary libraries
import pandas as pd
import sqlite3

# Load the data from a CSV file
data = pd.read_csv('data.csv')

# Connect to the SQLite database
conn = sqlite3.connect('database.db')

# Migrate the data to the database
data.to_sql('table_name', conn, if_exists='replace', index=False)

# Close the database connection
conn.close()