#!/bin/bash

# Let hyprland start
sleep 3

# Initial message
notify-send "System Update" "Starting system update..." -u normal

# Get update count
updates=$(yay -Qu)
update_count=$(echo "$updates" | wc -l)

# Send message
if [ $update_count -eq 0 ]; then
    notify-send "System Update" "Ssytemp is already up to date" -u normal
    exit 0
fi

# Update system, check for error messages
if output=$(yay -Syu --noconfirm 2>&1); then
    # Update succeed
    notify-send "System Update" "Update completed!\nUpdates $update_count packages" -u normal
else 
    # Update fail
    error_message=$(echo "$output" | tail -n 5) # Get last 5 lines of error
    notify-send "System Update Failed" "Error during update:\n$error_message" -u critical
    exit 1
fi
