#!/bin/bash
entries="󰌾 Lock\n󰜉 Reboot\n⏻ Shutdown"
selected=$(echo -e $entries | rofi -dmenu -p "Power Menu" -theme-str 'window {width: 325px; height: 200px;}' | awk '{print tolower($2)}')

case $selected in
  lock)
    hyprlock;;
  reboot)
    reboot;;
  shutdown)
    systemctl poweroff;;
esac
