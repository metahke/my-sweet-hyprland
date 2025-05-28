#!/usr/bin/env bash

# SCRIPT CREATED WITH CHATGPT - BE CAUTIOUS
# Ensure you thoroughly test the script on a safe environment before using it on important systems.
# Always backup your files before running automated scripts that modify your system!
#
# ./connect.sh --all
# ./connect.sh --choose hypr nvim foot

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/../dotfiles"
SYMLINKS_FILE="$SCRIPT_DIR/symlinks.txt"

# Sprawdż, czy folder dotfiles istnieje
[[ -d "$DOTFILES_DIR" ]] || { echo "❌ Brakuje katalogu $DOTFILES_DIR"; exit 1; }

# Sprawdź, czy plik symlinks.txt istnieje
[[ -f "$SYMLINKS_FILE" ]] || { echo "Brakuje $SYMLINKS_FILE"; exit 1; }

# --- Parsowanie argumentów ---
MODE="all"
CHOSEN_ITEMS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all)
      MODE="all"
      shift
      ;;
    --choose)
      MODE="choose"
      shift
      while [[ $# -gt 0 && ! "$1" =~ ^-- ]]; do
        CHOSEN_ITEMS+=("$1")
        shift
      done
      ;;
    *)
      echo "❌ Nieznany argument: $1"
      exit 1
      ;;
  esac
done

declare -a changes

echo "🔍 Zmiany do wykonania:"
while IFS= read -r line || [[ -n "$line" ]]; do
  [[ "$line" =~ ^# ]] && continue
  [[ -z "$line" ]] && continue

  read -ra parts <<< "$line"
  if [[ "${#parts[@]}" -ne 2 ]]; then
    echo "⚠️  Błędny wpis w symlinks.txt: '$line' (pomijam)" >&2
    continue
  fi

  source_name="${line%%[[:space:]]*}"
  target_raw="${line##*[[:space:]]}"

  # Filtrowanie przy --choose
  if [[ "$MODE" == "choose" && ! " ${CHOSEN_ITEMS[*]} " =~ " $source_name " ]]; then
    continue
  fi

  eval target="$target_raw"
  source="$DOTFILES_DIR/$source_name"

  if [[ ! -e "$source" ]]; then
    echo "⚠️  Brak źródła: $source" >&2
    continue
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    changes+=("🔁 Nadpisz: $target ← $source")
  else
    changes+=("➕ Utwórz:  $target ← $source")
  fi
done < "$SYMLINKS_FILE"

# Sprawdzamy, czy są jakiekolwiek zmiany do wykonania
if [[ "${#changes[@]}" -eq 0 ]]; then
  echo "❌ Nie znaleziono żadnych pasujących wpisów w symlinks.txt dla wyboru: ${CHOSEN_ITEMS[*]:-wszystko}"
  exit 1
fi

# Potwierdzenie
for change in "${changes[@]}"; do echo "$change"; done
echo
read -rp "⚠️  Czy chcesz wykonać te zmiany? (y/N): " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || { echo "❌ Anulowano."; exit 0; }

# Wykonanie
while IFS= read -r line || [[ -n "$line" ]]; do
  [[ "$line" =~ ^# ]] && continue
  [[ -z "$line" ]] && continue

  source_name="${line%%[[:space:]]*}"
  target_raw="${line##*[[:space:]]}"

  if [[ "$MODE" == "choose" && ! " ${CHOSEN_ITEMS[*]} " =~ " $source_name " ]]; then
    continue
  fi

  eval target="$target_raw"
  source="$DOTFILES_DIR/$source_name"

  if [[ ! -e "$source" ]]; then
    echo "⚠️  Źródło nie istnieje: $source; pomijam." >&2
    continue
  fi

  # create parent directory (with error check)
  mkdir -p "$(dirname "$target")" || { echo "❌ Nie mogę utworzyć katalogu: $(dirname "$target")"; continue; }

  # remove existing target if it exists (file or symlink)
  if [[ -L "$target" || -e "$target" ]]; then
    rm -rf "$target" || { echo "❌ Nie mogę usunąć: $target"; continue; }
  fi

  real_src="$(readlink -f "$source")"
  ln -s "$real_src" "$target"
  echo "✔ $target → $real_src"
done < "$SYMLINKS_FILE"

echo "✅ Gotowe!"
