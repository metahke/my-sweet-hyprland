#!/bin/sh

current_brightness=$(cat /sys/class/backlight/*/brightness)
max_brightness=$(cat /sys/class/backlight/*/max_brightness)

brightness_percentage=$((100 * current_brightness / max_brightness))

hyprctl notify -1 2000 "rgba(00000000)" fontsize:20 "$brightness_percentage%"
#echo "$brightness_percentage%"
