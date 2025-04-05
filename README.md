# Hyprland Configurations

## Requirements
1. copr:copr.fedorainfracloud.org:solopasha:hyprl
- hyprland
- hyprpaper
- hyprlock
- hyprsunset
- hypridle (OLD VERSION IN REPO: 1.3.4 -> 1.5)
- hyprpm
- Hyprspace

## Apps
- foot (kitty?)
- btop
- wofi
- grim & slurp & wl-copy
- bluetui (blueman?)
- mako
- [powernotd](https://lib.rs/crates/powernotd)

## What's this?
- playerctl?
- nm-applet?
- xwaylandvideobridge?
- hyprpolkitagent?
- beebeep?
- nnn / ranger / superfile / yazi (file manager)?
- uwsm?
- pavucontrol (a jakaś nowoczesna alternatywa TUI?)?
- nmtui?

## Upgrades

### Next
- weryfikacja powiadomień baterii;
- bind aplikacji zed nie działa prawidłowo?
- by workspaces sie usuwaly jesli po przeniesieniu z nich czegoś pozostają puste (jak w Hyprspace)

### Other
- manualna instalacja Hyprland (nie z repozytorium COPR)
- dodanie komunikatu hyprlock informującego o włączeniu caps/num locków (+ zmiana koloru);
- zrobienie researchu w kontekście bezpieczeństwa hyprlock #ważne (`bind = $mainMod, L, exec, loginctl lock-session`?); łącznie z komendą hypridle;
- zamiana wofi na coś innego;
- zrobienie, by #systemMonitor otwierał się fullscreen tylko na workspace:special:monitoring;
- lista wszystkich aplikacji zainstalowanych?
- problemy w łączeniu poprzez SSH w kitty? https://snoo.habedieeh.re/r/commandline/comments/prenxh/error_opening_terminal_xtermkitty/
- disable infinite workspaces scroll
- jakaś linia fiolet na dole ekranu i po prawej stronie, hm? (błąd Hyprspace);
- poprawienie działania overview;
- migracja z kitty na foot (+ konfiguracja i kolory i wygląd i skalowanie; Foot Server i Client potrzebne?);
- sprawdzić: https://www.youtube.com/watch?v=v8w1i3wAKiw;
- zmiana szerokości aktywnego okna komendą + strzałkami?
- weryfikacja poprawności powernotd i mako wraz z poszukaniem alternatyw (np. skrypt bash i obejmująca, np. poziom 85%, że można wtedy odłączyć) i przerzucenie na ładowanie systemctl?;
- zamiana mako na coś wspieranego w 2025 roku? (wbudowane powiadomienia w Hyprland? https://wiki.hyprland.org/Configuring/Using-hyprctl/#notify);
- szybki split pionowo/poziomo;
- poprawienie wyglądu aplikacji, np. gnome wyświetla się jasny motyw;
- ładniejsze wyświetlanie poziomu jasności/audio?
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

### Maybe
- poprawienie skalowania aplikacji X11, by nie były spikselizowane i miały zgodne skalowanie domyślne;
- `bind = $mainMod SHIFT, Q, killactive,` -> add confirmation box
