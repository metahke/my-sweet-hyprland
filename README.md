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
- nnn / ranger / superfile / yazi (file manager)?
- ładniejsze menu programów
- uwsm?
- pavucontrol (a jakaś nowoczesna alternatywa TUI?)?
- nmtui?


## Upgrades
- `bind = $mainMod SHIFT, Q, killactive,` -> add confirmation box
- dlaczego mogę instalować aplikacje bez podawania hasła?
- zamiana aktywnego okna z głównym, np. `bindm = $mainMod, mouse:272, layoutmsg swapwithmaster` (mam już do tego bindy: MOD + SHIFT + STRZAŁKI)
- manualna instalacja Hyprland (nie z repozytorium COPR)
- wyeksportowanie skali ekranu do osobnej zmiennej?
- zaimportowanie source do hyprpaper?
- czasami terminal się blokuje, gdy go nie używam przez jakiś czas? - do weryfikacji;
- dodanie komunikatu hyprlock informującego o włączeniu caps/num locków (+ zmiana koloru);
- zrobienie researchu w kontekście bezpieczeństwa hyprlock #ważne (`bind = $mainMod, L, exec, loginctl lock-session`?); łącznie z komendą hypridle;
- zamiana wofi na coś innego;
- zamiana waybar na coś innego (np. zamiast paska, to coś dostępnego w special workspace?; poprzez komendę);
- zrobienie, by #systemMonitor otwierał się fullscreen tylko na workspace:special:monitoring;
- Chromium/Gnome oprogramowanie nie działa? -> czemu = *okazuje się, że jeśli nacisnę MOD + strzałki w prawo lub lewo, to na danym workspace są te wszystkie aplikacje; czemu tak?* -> `binds {movefocus_cycles_fullscreen = 0}` -> chodzi o możliwość przełączania między oknami fullscreen;
- dokończenie ep.9 z info. dot. baterii w Hyprland (?);
- rodzielenie zrzutów ekranu na jakieś skrypty (do sprawdzenia; żeby zapisywały się do pamięci oraz do folderu użytkownika, który zdefiniuje (?)): # bind = $mainMod, V, exec, grim -g "$(slurp)" -f png "$HOME/Dokumenty/Zrzuty ekranu/Zrzut ekranu z $(date +'%Y-%m-%d %H-%M-%S').png" - | wl-copy (?)
- kontrolki głośności i jasności ekranu;
- opcja "cofnięcia" obecnego okna, która pokazuje wszystkie otwarte workspaces;
- lista wszystkich aplikacji zainstalowanych?
- uruchamianie Zed nie działa;
- dodanie ostrzeżenia o stanie baterii;
- poprawienie skalowania aplikacji X11, by nie były spikselizowane i miały zgodne skalowanie domyślne;
- problemy w łączeniu poprzez SSH?
