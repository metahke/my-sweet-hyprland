1. Shebang - jakiego interpretera używać do wykonania skryptu

`#!/usr/bin/env bash` - lepsze i bardziej uniwersalne od `#!/usr/bin/bash`

2. Komendy

- echo "Hello, World!" -> wyświetli napis
-

3. Uprawnienia

`chmod u+x script.sh` - "for user ass execute permissions"

4. Zmienne

```sh
name="Hello, World"

test = "Hello"  # Syntax error (traktuje test jako komendę, do której przekazujemy parametry)

name_length=${#name}

value=""
default_value=${value:-"anonymous"}
default_value_1=${value:="anonymous"}  # przypisze do value wartość anonymous

echo $name, $name_length
```

4. Subshell

`()` -> komendy wykonywane w nawiasach, np. `(cd ..; pwd)` pokaże lokalizacje folderu przed obecnym, ale późniejsze wywołanie `pwd` pokaże już ten standardowy (cd nie wpływa na obecny folder

`$(pwd)` -> przypisanie do zmiennej

`<()` -> procesy (?)

`$(())` -> arytmetyczne
np. $((3 + 7))

5. Argumenty w linii komend przy poleceniach

`./mergeavideo.sh input.mp4 input.wav output.mp4`

- "./mergeavideo.sh": $0
- "input.mp3" $1
- "input.wav": $2
- "output.mp4": $3

Warto wydobywać te zmienne i odpowiednio nazywać je w skrypcie

- `$#`: ile argumentów otrzymał skrypt


# 6. Warunki

## IF
```sh
if [[ warunek ]]; then
    echo "To jest prawda"
elif [[ inny_warunek ]]; then
    echo "Inny warunek to prawda"
else
    echo "Nie prawda"
fi
```

## Porównanie ciągów znaków
val="a"
[[ "$val" == "a" ]] # Equal
[[ "$val" != "b" ]] # Not equal

[["$val" != "b"]] # Syntax error


## Porównanie liczbowe
num=1
[[ "$num" -eq 1 ]] # Equal

- -ne -> Not Equal
- -lt -> Less than
- -le -> Less than or equal
- -gt -> Greater than
- -ge -> Greater than or equal

## Dostępność zmiennych
val=""
[[ -z $val ]] # Var is null (empty)
[[ -n $val ]] # Var is not-null

## Sprawdzanie plików
file="./hello"
[[ -f $file ]] # Plik istnieje
[[ -d $file ]] # Katalog istnieje
[[ -e $file ]] # Plik lub katalog istnieje

## Sprawdzenie uprawnień
file="./hello"
[[ -r $file ]] # Plik jest odczytywalny
[[ -w $file ]] # Plik jest zapisywalny
[[ -x $file ]] # Plik jest uruchamialny

## Połączenia (bramki?)
val=7

### Wewnętrzne (internal)
[[ $val -gt 5 -a $val -lt 10 ]] # -a -> Logical AND
[[ $val -gt 5 -o $val -lt 10 ]] # -o -> Logical OR

### Zewnętrzne (external)
[[ $val -gt 5 ]] && [[ $val -lt 10 ]] # Logical AND
[[ $val -gt 5 ]] || [[ $val -lt 10 ]] # Logical OR

# 7. Kody wyjścia

- 0 -> Kod powodzenia
- n -> każdy inny kod, brak powodzenia, może oznaczać cokolwiek i dany numer nie musi nic znaczyć, natomiast można samemu zdefiniować jaki kod wywołać i później ten kod można obsłużyć w przypadku błędu

np.
```
if grep -q "ERROR" "logs.txt"; then
    echo "Błędy w logach!"
else
    echo "Brak błędów w logach!;
fi
```

8. Pomocne komendy

- `sleep 30` # zatrzyma skrypt na 30 sekund
- `read -r name` # przypisz co wpisze użytkownik do zmiennej name, można użyć do potwierdzenia wykonania operacji (y/N)

## 9. Usprawnienie działania

`set -euo pipefail` # Bash zachowuje się lepiej "strict mode of bash"

- `set -e` # Exit on error (coś w skrypcie się nie powiedzie, a skrypt bez tego idzie dalej)
- `set -u` # Exit on unset variable
- `set -o pipefail` #Exit on pipe fail

### Uruchamianie warunkowe

Można używać && oraz || do wykonywania dalszych działań, np.

- `command1 && command2` # If the first succeeds, perform the next
- `command1 || command2` # If the first fails, perform the next

```
false || exit 1
echo "This line no longer runs"
```

## 9. Tablice

```
my_arr=(1 2 3 4 5)

echo ${my_arr[0]} # 1
echo ${my_arr[@]} lub $my_arr# odwołuje się do wszystkich elementów
echo ${#my_arr[@]} # wyświetla długość danego elementu
```

## 10. Pętle for

```sh
my_arr=(1 2 3 4 5)
for item in "${my_arr[@]}"; do
    echo $item
done
```

### C-style for-loop

```
for ((i = 0; i < 10; i++)); do
    echo "$i"
done
```

### Range

```
for i in {1..10}; do
    echo "$i"
done
```

### Dopasowanie wzorcowe

```
for item in ./content/*md; do
    echo $item
done
```

### Wyniki komend

```
for item in ${ls}; do
    echo $item
done
```

## 11. Pętle while

```
counter=0
while [[ $counter -lt 5 ]]; do
    echo $counter
    ((counter++))
done
```

- Przydatne w przypadku `while true; do...`, gdy oczekujemy na przykład na uruchomienie jakiejś aplikacji.
- "break" wychodzi z pętli

## 12. Podział na osobne pliki

```
./skrypt1.sh argument1 # nie modyfikuje zmiennych
./skrypt2.sh domain.com # jest uruchamiany w subshellu
```

"Sourcing" the script (share same shell):
```
. ./time.sh  # wówczas ten skrypt zostanie tak jakby wklejony w rodzica i będzie wykorzystał i modyfikował zmienne
```

## 13. Funkcje

- Zmienne w funkcjach wywołujemy wewnątrz funkcji przy pomocy `$1`, `$2`, jeśli uważamy to za potrzebne;
- Użycie słowa `local` sprawia, że zmienne są określane lokalnie wewnątrz funkcji;

```
function display () {
    local name=$1
    local age=$2

    echo "$name; $age"
}
```

## 14. Pliki/katalogi tymczasowe i czyszczenie

```
tempfile=$(mktemp) # tworzy plik tymczasowy
tempdir=$(mktemp -d) # tworzy folder tymczasowy
trap "rm -rf $tempfile" EXIT # wywołuje komendę usuwania pliku tymczasowego w momencie otrzymania sygnału "EXIT"

echo "Hello, World!" > $tempfile
```

## 15. Konwencje nazewnicze

- dla lokalnych skryptów można używać rozszerzenia ".sh"
- dla systemowych "komend" można używać samej nazwy bez rozszerzenia

## 16. $PATH


## 17. Dodatkowe

### Kiedy trzeba używać cudzysłowów przy zmiennych?

Zawsze wtedy, gdy wynik ekspansji może zawierać spacje, puste wartości, lub znaki specjalne.


### Wyciszenie standardowego wyjścia i błędów (?):

`if ! ping -c 1 -W 2 1.1.1.1 > /dev/null 2>&1; then`

### Wyciąganie słów z tekstu

```
# $0 jest do całości, pozostałe to argumenty
# pojedyncze cudzysłowia, by bash nie szukał zmiennych w skrypcie

echo "1 2 3 4 5" | awk '{ print $1, $3 }'
1 3
```

### Nowa linia

```
# Z użyciem $'\n':
result+="DOMAIN NAME RECORD_TYPE VALUE"$'\n'

# Lub ze znakami ASCII w całości:
result+=$'DOMAIN NAME RECORD_TYPE VALUE\n'
```

### Grupowanie poleceń

```
bash -c '{ echo "Hello"; echo "World"; }' | column -t
```

### liczba linii:
```
wc -l
```

### Przypisanie całej tablicy do innej zmiennej (kopiowanie)
```
new_array=("${original_array[@]}")
```

### Czytanie linii

```
# while ... read — klasyczny sposób iteracji po liniach tekstu.
# IFS= — wyłącza dzielenie po białych znakach (zapobiega psuciu formatowania)
# read -r — czyta linijkę dosłownie, bez interpretacji backslashów
# done <<< "$record_value" przesyła zawartość zmiennej jako wejście do pętli while

while IFS= read -r line_value; do
    result+="$record_type $line_value"$
done <<< "$record_value"
```

### Używanie zmiennej w tekście

```
# użycie klamr pozwala bashowi na zrozumienie, gdzie kończy się zmienna
result_header="RECORD_TYPE${columns_separator}VALUE"
```
