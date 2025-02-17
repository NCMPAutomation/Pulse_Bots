#!/bin/bash

# Function to manage services
manage_service() {
    local action=$1
    local service_name=$2

    case $action in
        start)
            sudo systemctl start "$service_name"
            ;;
        stop)
            sudo systemctl stop "$service_name"
            ;;
        restart)
            sudo systemctl restart "$service_name"
            ;;
        enable)
            sudo systemctl enable "$service_name"
            ;;
        disable)
            sudo systemctl disable "$service_name"
            ;;
        status)
            sudo systemctl status "$service_name"
            ;;
        *)
            echo "Invalid action. Use start, stop, restart, enable, disable, or status."
            exit 1
            ;;
    esac
}

# Main script
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <action> <service_name>"
    exit 1
fi

manage_service "$1" "$2"