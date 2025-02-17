#!/bin/bash

# Function to install yum-cron
install_yum_cron() {
    sudo yum install -y yum-cron
    sudo systemctl enable yum-cron
    sudo systemctl start yum-cron
}

# Function to configure yum-cron for automatic updates
configure_yum_cron() {
    sudo sed -i 's/^update_cmd = default/update_cmd = security/' /etc/yum/yum-cron.conf
    sudo sed -i 's/^apply_updates = no/apply_updates = yes/' /etc/yum/yum-cron.conf
    sudo systemctl restart yum-cron
}

# Main script
install_yum_cron
configure_yum_cron

echo "yum-cron has been installed and configured for automatic security updates."