# Import necessary libraries
import os

# Define the directory and new file name format
directory = '/path/to/files'
new_name_format = 'file_{}.txt'

# Rename each file in the directory
for i, filename in enumerate(os.listdir(directory)):
    new_name = new_name_format.format(i)
    os.rename(os.path.join(directory, filename), os.path.join(directory, new_name))