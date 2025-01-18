# hyprland.sh

# if a display manager is already running, do not run uwsm or hyprland
[ -n "$WAYLAND_DISPLAY" ] && return 0

if check_command hyprland; then 
    if check_command uwsm; then
        if uwsm check may-start; then
            exec uwsm start hyprland.desktop
        fi
    fi
fi

