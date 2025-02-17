#!/bin/bash

# Function to install a package manager
install_package_manager() {
    local package_manager=$1
    sudo apt-get update
    sudo apt-get install -y "$package_manager"
}

# Main script
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <package_manager>"
    exit 1
fi

install_package_manager "$1"