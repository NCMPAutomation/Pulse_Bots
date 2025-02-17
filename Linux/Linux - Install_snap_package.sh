#!/bin/bash

echo "Updating package list..."
sudo apt-get update

echo "Installing Snap package manager..."
sudo apt-get install -y snapd

if [ $? -eq 0 ]; then
    echo "Snap package manager installed successfully!"
else
    echo "Failed to install Snap package manager."
fi