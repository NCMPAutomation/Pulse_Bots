#!/bin/bash

echo "Enter the command you want to execute:"
read user_command
echo "Executing: $user_command"
eval $user_command