#!/bin/bash

# Define the path to the log file
LOG_FILE="/var/log/messages"

# Check if the log file exists
if [ -f "$LOG_FILE" ]; then
    # Display the last 100 lines of the log file
    tail -n 100 "$LOG_FILE"
else
    echo "Log file not found: $LOG_FILE"
fi