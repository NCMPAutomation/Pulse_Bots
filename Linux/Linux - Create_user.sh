#!/bin/bash

echo "Enter the username for the new user:"
read username

echo "Creating user $username..."
sudo useradd -m $username

if [ $? -eq 0 ]; then
    echo "User $username created successfully!"
    echo "Setting password for $username..."
    sudo passwd $username
else
    echo "Failed to create user $username."
fi