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
- doas
- fish
- foot
- btop
- wofi
- fuzzel
- grim & slurp & wl-copy
- blueman
- nm-connection-editor
- mako
- [powernotd](https://lib.rs/crates/powernotd)
- qalculate

## Scripts-Apps
- wifiManager.desktop
- wofiCalc.desktop


## What's this?
- hyprpolkitagent?
- uwsm?

## Krytyka Hyprland (dla dalszego rozwoju). Czy Hyprland jest używalny na co dzień?
-> Nie. Jest nieprzyjazny i nieprzyjemny. Wiele rzeczy nie działa tak, jakbym chciał by działały. Brakuje prostego działania. Męczy mnie przeklikiwanie obszarów przy pomocy MOD+NUMBER{1,2,3...}. Jest to wkurzające i nieczytelne. Podobnie jest to nieczytelne, gdy okno jest w trybie full screen - wówczas nie wiadomo, ile pozostałych okien otwartych jest w danym obszarze. Podoba mi się idea jaką niesie Hyprland, ale jakieś to wszystko nie takie... Nie przeszkadzają mi na razie problemy w konkteście Wi-Fi/Bluetooth, a bardziej te związane z cztelnością obszarów. Chciałbym by były podobne do Gnome.

GNOME... wydaje się być po prostu prawidłowy i naturalny w obsłudze. Ile ja się muszę namęczyć w Hyprland, by coś osiągnąć! Chodzi o brak czytelności, ale właśnie dlatego wydaje się to być dobrą szansą na rozwój - by dostosować Hyprland w taki sposób, by był tak przywoity w użytkowaniu, jak GNOME (lub bardziej).


## Upgrades

### Next
- nie działa overview:toggle prawidłowo po aktualizacji hyprlanda;
- termination wofi/zrzut ekranu jeśli otworzy się kolejne
- skrypt aktualizacji systemu/hyprland
- naprawienie wofi-file_search.sh po zmianie na fish
- pełna zamiana sudo na doas
- weryfikacja powiadomień baterii
- zamiana wofi na coś innego (Walker, fuzzel?)

### Check
- jakaś linia fiolet na dole ekranu i po prawej stronie, hm? (błąd Hyprspace)
- poprawienie działania overview
- błąd Hyprspace, gdy okno jest fullscreen i się wywoła hyprspace, to przeskakuje
- weryfikacja poprawności powernotd i mako wraz z poszukaniem alternatyw (np. skrypt bash i obejmująca, np. poziom 85%, że można wtedy odłączyć) i przerzucenie na ładowanie systemctl?;
- zamiana mako na coś wspieranego w 2025 roku? (wbudowane powiadomienia w Hyprland? https://wiki.hyprland.org/Configuring/Using-hyprctl/#notify);

### Maybe
- weryfikacja, czy Foot Server i Client są potrzebne
- rozwiązanie błędów kluczy przy wypychaniu repo przez ssh (ssh-agent etc. w fish)
- przeorganizowanie struktury plików (symlink Downloads do DANE/downloads etc)
- super program, który zadba o kondycję baterii, tak jak w gnome;
- fish shell nie spełnia moich wymagań, alternatywy: https://www.nushell.sh/ i https://magicant.github.io/yash/
- poprawienie audio/brightness pod kątem skryptów (uproszczenie bindings hyprland)
- lepsze zarządzanie istotnymi danymi zamiast folderów Dokumenty/Obrazy/Wideo
- poprawa jakości dźwięku na słuchawkach - wydaje się być gorsza od tego, co jest na Fedorze z Gnome
- "The login keyring didn't get unlocked..."
- alternatywa dla Gnome Software (skąd wiedzieć, co jest zainstalowane, co można usunąć itp)
- alternatywa dla Zgłaszanie problemów GNOME
- szybka zamiana workspace, np. 1 z 3
- bind klawiatury apple keyboard przycisku odp. za "`~"
- hyprsunset nie działa przy starcie przy przelogowaniu z Gnome (?)
- otwarcie okna w workspace_1, powinno otworzyć to okno w tym workspace, nawet jeśli w między czasie przełączę się na inne
- skrypt, który podmienia kolory na czerwone w Hyprland, gdy poziom baterii jest poniżej, np. 20%
- zmiana kursora na cappucin theme? https://github.com/catppuccin/cursors
- naprawienie brzydkiego wyświetlania logowania do systemu po aktualizacji Fedora: np. w oczekiwaniu na zalogowanie wyświetla się prompt hasła luks
- samodzielne przerobienie skryptu instalacyjnego
- dodanie do skryptu instalacyjnego podpinania folderu scripts do $HOME/scripts oraz kopiowania plików desktop
- podpiecie wofi-powermenu.sh pod przycisk zasilania
- ulepszenie skryptu podłączającego (instalującego) potrzebne pliki z repozytorium
- dowiedzenie się w jaki sposób zabezpieczyć konfigurację, by hyprland uruchamiał się pomimo jej braku (lub gdyby coś się stało)
- sprawdzić: https://www.youtube.com/watch?v=v8w1i3wAKiw
- poprawienie wyglądu aplikacji, np. gnome wyświetla się jasny motyw
- przetestowanie i używanie terminalowej przeglądarki plików (nnn/ranger/superfile/yazi) (lub tylko ff?)
- zarządzanie wifi, bluetooth z poziomu Wofi (https://github.com/podobu/wifimenu)
- bind aplikacji zed nie działa prawidłowo (szczególnie, gdy aplikacja jest już uruchomiona - może jest coś w stylu --new-tab?)
- by workspaces sie usuwaly jesli po przeniesieniu z nich czegoś pozostają puste (jak w Hyprspace)
- znalezienie alternatyw TUI/GUI dla nm-applet, pavucontrol oraz blueman
- dodanie komunikatu hyprlock informującego o włączeniu caps/num locków (+ zmiana koloru) + aktualna godzina
- zrobienie researchu w kontekście bezpieczeństwa hyprlock #ważne (`bind = $mainMod, L, exec, loginctl lock-session`?); łącznie z komendą hypridle
- zrobienie, by #systemMonitor otwierał się fullscreen tylko na workspace:special:monitoring
- lista wszystkich aplikacji zainstalowanych?
- disable infinite workspaces scroll
- zmiana szerokości aktywnego okna komendą + strzałkami?
- lepsze ograniczenie maksymalnego dźwięku;
- "Failed to obtain authentication"?
- dodanie skryptu auto-rozłączającego urządzenia wybrane (myszka, klawiatura) i łączące się z nimi po starcie;
  1. po naciśnięciu kombinacji klawiszy (?) / lub przez skrypt w terminalu;
  2. usuń urządzenia o podanych adresach MAC;
  3. wyszukaj je i połącz się z nimi
- poprawienie komendy tworzenia zrzutów ekranu, np. rozdzielenie jej jako skrypt
- błędy w skalowaniu, jesli window jest fullscreen i przejdzie się do fullscreen w wideo, np. youtube
- firewall?
- poprawienie skalowania aplikacji X11, by nie były spikselizowane i miały zgodne skalowanie domyślne;
- `bind = $mainMod SHIFT, Q, killactive,` -> add confirmation box
- manualna instalacja Hyprland (nie z repozytorium COPR)
- ładniejsze wyświetlanie poziomu jasności/audio?
- temp gpt keybinding
- lepsze zabezpieczenie kluczy SSH przechowywanych w .ssh?
