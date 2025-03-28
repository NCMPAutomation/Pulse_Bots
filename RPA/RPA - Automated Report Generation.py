# Import necessary libraries
import pandas as pd
import matplotlib.pyplot as plt

# Load the data
data = pd.read_csv('data.csv')

# Generate a summary report
summary = data.describe()

# Save the summary report to a text file
with open('summary_report.txt', 'w') as file:
    file.write(summary.to_string())

# Create a plot of the data
data.plot(kind='bar')

# Save the plot to an image file
plt.savefig('data_plot.png')