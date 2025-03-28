#!/bin/bash
# Automatically rotates logs weekly
logfile="/path/to/logfile.log"
mv $logfile $logfile.$(date +%F)
touch $logfile