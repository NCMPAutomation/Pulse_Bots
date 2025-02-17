#!/bin/bash

echo "Enter the username of the user you want to remove:"
read username

echo "Removing user $username..."
sudo userdel -r $username

if [ $? -eq 0 ]; then
    echo "User $username removed successfully!"
else
    echo "Failed to remove user $username."
fi