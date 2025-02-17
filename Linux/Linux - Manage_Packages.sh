#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 {install|remove|update} package_name"
    exit 1
}

# Check if the user provided the correct number of arguments
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign the action and package name to variables
ACTION=$1
PACKAGE=$2

# Detect the package manager
if command -v apt > /dev/null; then
    PKG_MANAGER="apt"
elif command -v yum > /dev/null; then
    PKG_MANAGER="yum"
else
    echo "Unsupported package manager. Only apt and yum are supported."
    exit 1
fi

# Perform the action based on the package manager and user input
case $ACTION in
    install)
        sudo $PKG_MANAGER install -y $PACKAGE
        ;;
    remove)
        sudo $PKG_MANAGER remove -y $PACKAGE
        ;;
    update)
        sudo $PKG_MANAGER update -y $PACKAGE
        ;;
    *)
        usage
        ;;
esac

echo "Action '$ACTION' performed on package '$PACKAGE' using $PKG_MANAGER."
