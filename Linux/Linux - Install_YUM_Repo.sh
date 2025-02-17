#!/bin/bash

echo "Enter the name of the software you want to install:"
read software_name

echo "Updating package list..."
sudo yum update -y

echo "Installing $software_name..."
sudo yum install -y $software_name

if [ $? -eq 0 ]; then
    echo "$software_name installed successfully!"
else
    echo "Failed to install $software_name."
fi