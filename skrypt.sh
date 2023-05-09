#!/bin/bash

option=""
num_files=100

read -p "Wpisz żądaną opcję: " option

if [[ $option == "--date" ]] || [[ $option == "-d" ]]; then
  date
elif [[ $option == "--logs" ]] || [[ $option == "-l" ]]; then
  read -p "Podaj liczbę plików do utworzenia: " num_files
  for ((i=1; i<=$num_files; i++))
  do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done
elif [[ $option == "--help" ]] || [[ $option == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "--date (-d): wyświetla aktualną datę"
  echo "--logs (-l) [liczba]: tworzy określoną liczbę plików logx.txt, gdzie x to numer pliku. W każdym pliku zostanie zapisana jego nazwa, nazwa skryptu, który go utworzył, oraz data utworzenia."
  echo "--help (-h): wyświetla wszystkie dostępne opcje"
  echo "--version (-v): wyświetla informacje o wersji skryptu"
  echo "--info (-i): wyświetla informacje o skrypcie"
  echo "--init: klonuje repozytorium i ustawia ścieżkę w zmiennej środowiskowej PATH"
  echo "--error (-e) [liczba]: tworzy określoną liczbę plików errorx/errorx.txt, gdzie x to numer pliku. W każdym pliku zostanie zapisana jego nazwa, nazwa skryptu, który go utworzył, oraz data utworzenia."
elif [[ $option == "--version" ]] || [[ $option == "-v" ]]; then
  echo "Wersja skryptu: 1.0"
elif [[ $option == "--info" ]] || [[ $option == "-i" ]]; then
  echo "Skrypt do zarządzania datą i plikami logów."
elif [[ $option == "--init" ]]; then
	git clone https://github.com/Ksardess/Lab4-DSW49430.git . && export PATH=$PATH:$(pwd)
  echo "Repozytorium zostało sklonowane, a ścieżka została dodana do zmiennej środowiskowej PATH."
elif [[ $option == "--error" ]] || [[ $option == "-e" ]]; then
  read -p "Podaj liczbę plików do utworzenia: " num_files
  for ((i=1; i<=$num_files; i++))
  do
    dirname="error${i}"
    filename="${dirname}/${dirname}.txt"

    mkdir "$dirname"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done
else
  echo "Nieprawidłowa opcja. Użyj --help (-h), aby wyświetlić wszystkie dostępne opcje."
  fi
