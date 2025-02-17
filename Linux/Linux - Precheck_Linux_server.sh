#!/bin/bash

echo "Performing basic prechecks..."

# Check disk space
echo "Checking disk space..."
df -h

# Check memory usage
echo "Checking memory usage..."
free -h

# Check system uptime
echo "Checking system uptime..."
uptime

# Check CPU load
echo "Checking CPU load..."
top -bn1 | grep "load average"

# Check running processes
echo "Checking running processes..."
ps aux --sort=-%mem | head -n 10

echo "Prechecks completed."