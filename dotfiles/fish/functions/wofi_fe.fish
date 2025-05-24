function wofi_fe
    # Wyszukaj pliki przy użyciu fd i wyświetl je w wofi
    set file (fd --type f . $HOME | wofi --dmenu --prompt "Wybierz plik:" --width: 60% --height 60%)

    # Jeśli wybrano plik, otwórz go w nvim
    if test -n "$file"
        nvim "$file"
    end
end
