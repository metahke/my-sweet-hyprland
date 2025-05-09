# Hyprland Configurations

## Requirements
1. copr:copr.fedorainfracloud.org:solopasha:hyprl
- hyprland
- hyprpaper
- hyprlock
- hyprsunset
- hypridle
- hyprpm
- Hyprspace

## Apps
- foot (kitty?)
- btop
- wofi
- grim & slurp & wl-copy
- bluetui / blueman
- mako
- [powernotd](https://lib.rs/crates/powernotd)

## What's this?
- hyprpolkitagent?
- uwsm?

## Is Hyprland usable daily?



## Upgrades

### Next
- weryfikacja powiadomień baterii;

### Other
- weryfikacja ścieżek do plików i skryptów po dokonaniu reorganizacji folderów
- wyszukiwanie plików w Wofi;
- ulepszenie skryptu podłączającego (instalującego) potrzebne pliki z repozytorium
- dowiedzenie się w jaki sposób zabezpieczyć konfigurację, by hyprland uruchamiał się pomimo jej braku (lub gdyby coś się stało)
- sprawdzić: https://www.youtube.com/watch?v=v8w1i3wAKiw;
- dodać dotfiles systemowe, typu .bashrc oraz .profile?
- poprawienie wyglądu aplikacji, np. gnome wyświetla się jasny motyw;
- przetestowanie i używanie terminalowej przeglądarki plików (nnn/ranger/superfile/yazi)
- zarządzanie wifi, bluetooth z poziomu Wofi (https://github.com/podobu/wifimenu)
- bind aplikacji zed nie działa prawidłowo?
- by workspaces sie usuwaly jesli po przeniesieniu z nich czegoś pozostają puste (jak w Hyprspace)
- znalezienie alternatyw TUI/GUI dla nm-applet, pavucontrol oraz blueman
- dodanie komunikatu hyprlock informującego o włączeniu caps/num locków (+ zmiana koloru);
- zrobienie researchu w kontekście bezpieczeństwa hyprlock #ważne (`bind = $mainMod, L, exec, loginctl lock-session`?); łącznie z komendą hypridle;
- zamiana wofi na coś innego (Walker, fuzzel?);
- zrobienie, by #systemMonitor otwierał się fullscreen tylko na workspace:special:monitoring;
- lista wszystkich aplikacji zainstalowanych?
- problemy w łączeniu poprzez SSH w kitty? https://snoo.habedieeh.re/r/commandline/comments/prenxh/error_opening_terminal_xtermkitty/
- disable infinite workspaces scroll
- jakaś linia fiolet na dole ekranu i po prawej stronie, hm? (błąd Hyprspace);
- poprawienie działania overview;
- migracja z kitty na foot (+ konfiguracja i kolory i wygląd i skalowanie; Foot Server i Client potrzebne?);
- zmiana szerokości aktywnego okna komendą + strzałkami?
- weryfikacja poprawności powernotd i mako wraz z poszukaniem alternatyw (np. skrypt bash i obejmująca, np. poziom 85%, że można wtedy odłączyć) i przerzucenie na ładowanie systemctl?;
- zamiana mako na coś wspieranego w 2025 roku? (wbudowane powiadomienia w Hyprland? https://wiki.hyprland.org/Configuring/Using-hyprctl/#notify);
- lepsze ograniczenie maksymalnego dźwięku;
- "Failed to obtain authentication"?
- dodanie skryptu auto-rozłączającego urządzenia wybrane (myszka, klawiatura) i łączące się z nimi po starcie;
  1. po naciśnięciu kombinacji klawiszy (?) / lub przez skrypt w terminalu;
  2. usuń urządzenia o podanych adresach MAC;
  3. wyszukaj je i połącz się z nimi
- poprawienie komendy tworzenia zrzutów ekranu, np. rozdzielenie jej jako skrypt
- upewnienie się, że Hyprland zarządza baterią laptopa tak dobrze, jak GNOME
- błędy w skalowaniu, jesli window jest fullscreen i przejdzie się do fullscreen w wideo, np. youtube
- firewall?
- błąd Hyprspace, gdy okno jest fullscreen i się wywoła hyprspace, to przeskakuje

### Maybe
- poprawienie skalowania aplikacji X11, by nie były spikselizowane i miały zgodne skalowanie domyślne;
- `bind = $mainMod SHIFT, Q, killactive,` -> add confirmation box
- manualna instalacja Hyprland (nie z repozytorium COPR)
- ładniejsze wyświetlanie poziomu jasności/audio?
