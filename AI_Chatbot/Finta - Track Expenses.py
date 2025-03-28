import csv
from datetime import datetime

# Define the expense details
date = datetime.now().strftime("%Y-%m-%d")
category = "Groceries"
amount = 50.00
description = "Weekly groceries"

# Append the expense to a CSV file
with open('expenses.csv', mode='a', newline='') as file:
    writer = csv.writer(file)
    writer.writerow([date, category, amount, description])