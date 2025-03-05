#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.config/hypr/current_wallpaper"

# Create wallpaper tracking file if it doesn't exist
if [ ! -f "$CURRENT_WALLPAPER_FILE" ]; then
    touch "$CURRENT_WALLPAPER_FILE"
fi

# Get list of image files (properly handling spaces in filenames)
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) 2>/dev/null)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    echo "󰸉" # Icon for no wallpapers found
    exit 1
fi

switch_wallpaper() {
    # Get current wallpaper
    CURRENT_WALLPAPER=$(cat "$CURRENT_WALLPAPER_FILE" 2>/dev/null)
    
    # Find next wallpaper
    NEXT_INDEX=0
    if [ -n "$CURRENT_WALLPAPER" ]; then
        for i in "${!WALLPAPERS[@]}"; do
            if [ "${WALLPAPERS[$i]}" = "$CURRENT_WALLPAPER" ]; then
                NEXT_INDEX=$(( (i + 1) % ${#WALLPAPERS[@]} ))
                break
            fi
        done
    fi
    
    # Set new wallpaper
    NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"
    echo "$NEXT_WALLPAPER" > "$CURRENT_WALLPAPER_FILE"
    
    # Apply with hyprpaper - properly quoting paths for spaces
    hyprctl hyprpaper unload all 2>/dev/null
    hyprctl hyprpaper preload "${NEXT_WALLPAPER}" 2>/dev/null
    hyprctl hyprpaper wallpaper "DP-3,${NEXT_WALLPAPER}" 2>/dev/null
    hyprctl hyprpaper wallpaper "HDMI-A-1,${NEXT_WALLPAPER}" 2>/dev/null
}

# If script is called with an argument, switch wallpaper
if [ "$1" = "switch" ]; then
    switch_wallpaper
    exit 0
fi

# Display current wallpaper icon for waybar
echo "󰸌"