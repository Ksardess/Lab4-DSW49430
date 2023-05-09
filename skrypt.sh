#!/bin/bash

if [[ $1 == "--date" ]] || [[ $1 == "-d" ]]; then
  date
elif [[ $1 == "--logs" ]] || [[ $1 == "-l" ]]; then
  if [[ -z $2 ]]; then
    echo "Nieprawidłowa opcja. Podaj liczbę plików do utworzenia."
  else
    num_files=$2
    for ((i=1; i<=$num_files; i++))
    do
      filename="log${i}.txt"
      echo "Nazwa pliku: $filename" > "$filename"
      echo "Nazwa skryptu: $0" >> "$filename"
      echo "Data utworzenia: $(date)" >> "$filename"
    done
  fi
elif [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "--date (-d): wyświetla aktualną datę"
  echo "--logs (-l) [liczba]: tworzy określoną liczbę plików logx.txt, gdzie x to numer pliku. W każdym pliku zostanie zapisana jego nazwa, nazwa skryptu, który go utworzył, oraz data utworzenia."
  echo "--help (-h): wyświetla wszystkie dostępne opcje"
else
  echo "Nieprawidłowa opcja. Użyj --help (-h), aby wyświetlić wszystkie dostępne opcje."
fi
