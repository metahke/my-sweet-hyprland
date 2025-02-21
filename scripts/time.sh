#! /bin/bash

time=$( date +%H:%M )

hyprctl notify -1 2000 "rgba(00000000)" fontsize:20 "$time"
#notify-send $time
