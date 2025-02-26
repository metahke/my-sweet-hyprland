# Settings

- Możliwe jest wyłączenie middle-click paste;
- Kolejność source w pliku hyprland.conf ma znaczenie;

## hyprpm
`hyprpm update;
sudo dnf install hyprland-devel cpio cmake make meson ninja glm-devel`

## monitors.conf

- Podstawowe działajace ustawienie (monitor = name, resolution, position, scale):
`monitor=,preferred,auto,auto`


## keybindings.conf

- Wylogowanie z obecnej sesji:
`bind = $mainMod, M, exit,`

- Zmiana okna na pływajace, dzięki czemu z pomocą ALT/SUPER_KEY możemy je dowolnie przenosić i zmieniać rozmiar prawym przyciskiem myszy:
`bind = $mainMod, V, togglefloating,`

- Minimalizuje okno do bardzo małej wartości po środku ekranu (nie widzę zastosowania):
`bind = $mainMod, P, pseudo, # dwindle`

- Zmienia organizację okna (nie widzę zastosowania):
`bind = $mainMod, J, togglesplit, # dwindle`

- Uruchomienie okna specjalnego (scratchpad'a), nazwę magic można modyfikować i tworzyć wiele specjalnych okien:
`bind = $mainMod, S, togglespecialworkspace, magic`

- Dodaje aktywne okno do okna specjalnego (scratchpad'a), nazwę magic można dostosowywać do konkretnego okna:
`bind = $mainMod SHIFT, S, movetoworkspace, special:magic`

- Pozwala na przenoszenie i zmianę rozmiaru okien przy pomocy myszki:
`bindm = $mainMod, mouse:272, movewindow`
`bindm = $mainMod, mouse:273, resizewindow`


## autostart.conf

- Uruchamia daną aplikację podczas startu systemu (raz, bez ponownego uruchamiania po reloadzie hyprlanda); by nie blokowała, należy dodać znaczek "&" na końcu:
`exec-once = $terminal `
`exec-once = waybar &`

- Uruchamia daną aplikację w konkretnym workspace, w tym wypadku w scratchpadzie o nazwie "magic":
`exec-once = [workspace special:magic silent] $terminal`


## workspace-rules.conf

- Możliwe jest ustawianie własnych workspaces zależnie od monitora:
`workspace = 1, name:FOCUS, monitor: DP-1`
`workspace = SPECIAL, name:SCRATCH`


## aesthetics.conf

- Umożliwia dostosowywanie rozmiaru okien (general):
`resize_on_border = true`

- W zasadzie, to nie wiem, po co (general):
`allow_tearing = false`

- Pozwala na ustawienie przezroczystości okien:
`active_opacity = 1.0`
`inactive_opacity = 1.0`
