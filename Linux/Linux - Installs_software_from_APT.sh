#!/bin/bash

# Function to install from URL
install_from_url() {
    local url=$1
    wget -O /tmp/package.deb "$url"
    sudo dpkg -i /tmp/package.deb
    sudo apt-get install -f
}

# Function to install from local file
install_from_file() {
    local file_path=$1
    sudo dpkg -i "$file_path"
    sudo apt-get install -f
}

# Main script
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <url|file> <path>"
    exit 1
fi

if [ "$1" == "url" ]; then
    install_from_url "$2"
elif [ "$1" == "file" ]; then
    install_from_file "$2"
else
    echo "Invalid option. Use 'url' or 'file'."
    exit 1
fi