#!/bin/sh

# Pobranie aktualnej głośności w skali 0.0 - 1.0
current_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o '\[MUTED\]')

# Ograniczenie maksymalnej wartości do 1.0 (100%)
if (( $(echo "$current_volume > 1.0" | bc -l) )); then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1.0
    current_volume=1.0
fi

# Konwersja do wartości procentowej
current_volume=$(awk -v vol="$current_volume" 'BEGIN { printf "%.0f\n", vol * 100 }')

if [ -n "$mute_status" ]; then
    volume_display="Muted"
else
    volume_display="${current_volume}%"
fi

hyprctl notify -1 2000 "rgba(00000000)" fontsize:20 "$volume_display"
