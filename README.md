# Hyprland Configurations

## Requirements
1. copr:copr.fedorainfracloud.org:solopasha:hyprl
- hyprland
- hyprpaper
- hyprlock
- hyprsunset
- hypridle (OLD VERSION IN REPO: 1.3.4 -> 1.5)

## Apps
- btop
- wofi
- waybar
- grim & slurp & wl-copy
- bluetui


## What's this?
- window notifications? (np. dla okna specjalnego)
- playerctl?
- nm-applet?
- xwaylandvideobridge?
- hyprpolkitagent?
- swaync (system notifications)?
- beebeep?
- ranger / nnn (file manager)?
- ładniejsze menu programów
- uwsm?
- pavucontrol (a jakaś nowoczesna alternatywa TUI?)?
- nmtui?


## Upgrades

- `bind = $mainMod SHIFT, Q, killactive,` -> add confirmation box
- dlaczego mogę instalować aplikacje bez podawania hasła?
- zamiana aktywnego okna z głównym, np. `bindm = $mainMod, mouse:272, layoutmsg swapwithmaster`
- manualna instalacja Hyprland (nie z repozytorium COPR)
- naprawienie pikselizacji aplikacji X11, np. Chromium
- wyeksportowanie skali ekranu do osobnej zmiennej?
- zaimportowanie source do hyprpaper?
- czasami terminal się blokuje, gdy go nie używam przez jakiś czas? - do weryfikacji;
- dodanie komunikatu hyprlock informującego o włączeniu caps/num locków (+ zmiana koloru);
- zrobienie researchu w kontekście bezpieczeństwa hyprlock #ważne (`bind = $mainMod, L, exec, loginctl lock-session`?); łącznie z komendą hypridle;
- zamiana wofi na coś innego;
- zamiana waybar na coś innego (np. zamiast paska, to coś dostępnego w special workspace?; poprzez komendę);
- zrobienie, by #systemMonitor otwierał się fullscreen tylko na workspace:special:monitoring;
- Chromium/Gnome oprogramowanie nie działa? -> czemu = *okazuje się, że jeśli nacisnę MOD + strzałki w prawo lub lewo, to na danym workspace są te wszystkie aplikacje; czemu tak?*;
- dokończenie ep.9 z info. dot. baterii w Hyprland (?);
- rodzielenie zrzutów ekranu na jakieś skrypty (do sprawdzenia; żeby zapisywały się do pamięci oraz do folderu użytkownika, który zdefiniuje (?)): # bind = $mainMod, V, exec, grim -g "$(slurp)" -f png "$HOME/Dokumenty/Zrzuty ekranu/Zrzut ekranu z $(date +'%Y-%m-%d %H-%M-%S').png" - | wl-copy (?)
- kontrolki głośności i jasności ekranu;
- opcja "cofnięcia" obecnego okna, która pokazuje wszystkie otwarte workspaces;
- lista wszystkich aplikacji zainstalowanych?
- uruchamianie Zed nie działa;
- dodanie ostrzeżenia o stanie baterii;


## Settings

- Możliwe jest wyłączenie middle-click paste;


### monitors.conf

- Podstawowe działajace ustawienie (monitor = name, resolution, position, scale):
`monitor=,preferred,auto,auto`


### keybindings.conf

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


## variables.conf

Umożliwia przechowywanie zmiennych, np. ścieżki do jakiejś aplikacji, której możemy używać wewnątrz plików konfiguracyjnych.


## aesthetics.conf

- Umożliwia dostosowywanie rozmiaru okien (general):
`resize_on_border = true`

- W zasadzie, to nie wiem, po co (general):
`allow_tearing = false`

- Pozwala na ustawienie przezroczystości okien:
`active_opacity = 1.0`
`inactive_opacity = 1.0`
