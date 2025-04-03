#!/bin/bash

# Function to change permissions
change_permissions() {
    local path=$1
    local permissions=$2

    if [ -e "$path" ]; then
        chmod "$permissions" "$path"
        echo "Permissions for '$path' changed to '$permissions'."
    else
        echo "Error: '$path' does not exist."
    fi
}

# Change the permissions of a folder
change_permissions "/path/to/your/folder" "777"
