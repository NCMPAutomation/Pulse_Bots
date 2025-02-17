#!/bin/bash

echo "Are you sure you want to reboot the machine? (yes/no)"
read confirmation

if [ "$confirmation" == "yes" ]; then
    echo "Rebooting the machine..."
    sudo reboot
else
    echo "Reboot cancelled."
fi