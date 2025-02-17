#!/bin/bash

# Define the group name
GROUP_NAME="newgroup"

# Check if the group already exists
if getent group "$GROUP_NAME" > /dev/null 2>&1; then
    echo "Group '$GROUP_NAME' already exists."
else
    # Create the new group
    groupadd "$GROUP_NAME"
    if [ $? -eq 0 ]; then
        echo "Group '$GROUP_NAME' has been created successfully."
    else
        echo "Failed to create group '$GROUP_NAME'."
    fi
fi
