#!/bin/bash

# Function to install EPEL repository
install_epel() {
    sudo yum install -y epel-release
}

# Function to install Snap package manager
install_snap() {
    sudo yum install -y snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
}

# Main script
install_epel
install_snap

echo "EPEL repository and Snap package manager have been installed."