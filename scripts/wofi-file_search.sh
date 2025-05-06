#!/bin/bash

wofi_fe() {
  local file

  # Wyszukaj pliki przy użyciu fd i wyświetl je w wofi
  file=$(fd --type f . $HOME | wofi --dmenu --prompt ">")

  # Jeśli wybrano plik, otwórz go w nvim
  if [[ -n "$file" ]]; then
    foot -e nvim "$file"
  fi
}

# Wywołanie funkcji, aby działała po uruchomieniu skryptu
wofi_fe
