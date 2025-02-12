#!/bin/bash
# Define the output file for the report
REPORT_FILE="/var/log/last_reboot_report.txt"
# Get the last reboot time
last_reboot=$(who -b | awk '{print $3, $4}')
# Write the report to the file
echo "Last Reboot Time: $last_reboot" > $REPORT_FILE
# Output the report file path
echo "The last reboot report has been saved to: $REPORT_FILE"
 