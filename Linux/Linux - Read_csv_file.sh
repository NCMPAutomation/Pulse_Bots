#!/bin/bash

# Define the path to the CSV file
CSV_FILE="path/to/your/file.csv"

# Check if the file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "File '$CSV_FILE' does not exist."
    exit 1
fi

# Read the CSV file line by line
while IFS=, read -r column1 column2 column3; do
    echo "Column 1: $column1"
    echo "Column 2: $column2"
    echo "Column 3: $column3"
    echo "----------------------"
done < "$CSV_FILE"
