#!/usr/bin/env bash

# Lista opcji menu
choices=(
    " Zablokuj"
    " Wyloguj"
    " Uruchom ponownie"
    " Wyłącz"
)

# Zbuduj menu (indeks → tekst) i przekaż do wofi
menu=$(printf '%s\n' "${choices[@]}")
selected=$(echo "$menu" | wofi --no-sort --conf $HOME/.config/wofi/config_nosearch --dmenu)

# Jeśli anulowano wybór, zakończ
[[ -z "$selected" ]] && exit

# Znajdź indeks wybranej opcji
for i in "${!choices[@]}"; do
    if [[ "${choices[$i]}" == "$selected" ]]; then
        choice=$i
        break
    fi
done

# Funkcja potwierdzenia
confirm() {
    answer=$(printf "Nie\nTak" | wofi --no-sort --conf $HOME/.config/wofi/config_nosearch --dmenu)
    [[ "$answer" == "Tak" ]]
}

# Wykonaj akcję na podstawie indeksu
case "$choice" in
    0)
        hyprlock
        ;;
    1)
        confirm "Wylogować?" && hyprctl dispatch exit
        ;;
    2)
        confirm "Uśpić?" && systemctl reboot
        ;;
    3)
        confirm "Wyłączyć?" && systemctl poweroff
        ;;
esac
