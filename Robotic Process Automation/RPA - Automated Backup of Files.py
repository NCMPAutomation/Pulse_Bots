# Import necessary libraries
import shutil
import os

# Define the source and destination directories
source_directory = '/path/to/source'
backup_directory = '/path/to/backup'

# Copy each file from the source to the backup directory
for filename in os.listdir(source_directory):
    source_file = os.path.join(source_directory, filename)
    backup_file = os.path.join(backup_directory, filename)
    shutil.copy(source_file, backup_file)