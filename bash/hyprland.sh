# Hyprland
if check_command hyprland; then 
    if check_command uwsm; then
        if uwsm check may-start; then
            exec uwsm start hyprland.desktop
        fi
    fi
fi

