#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"
FILENAME="$SCREENSHOT_DIR/screenshot-$(date +%Y.%m.%d-%H:%M:%S).png"

if grim -g "$(slurp)" "$FILENAME"; then
    if wl-copy < "$FILENAME"; then
        notify-send "Screenshot saved and copied" "File: $FILENAME"
    else
        notify-send "Screenshot saved, but copy failed" "File: $FILENAME"
    fi
else
    # Remove empty file if it exists
    rm -f "$FILENAME"
fi
