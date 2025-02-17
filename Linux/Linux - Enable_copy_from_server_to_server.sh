#!/bin/bash

echo "Enter the source file path (e.g., /path/to/file.txt):"
read source_file
echo "Enter the destination server (e.g., user@destination_server:/path/to/destination/):"
read destination

echo "Copying $source_file to $destination"
scp $source_file $destination

if [ $? -eq 0 ]; then
    echo "File copied successfully!"
else
    echo "File copy failed!"
fi
