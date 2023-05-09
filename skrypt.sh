#!/bin/bash

if [[ $1 == "--date" ]]; then
  date
elif [[ $1 == "--logs" ]]; then
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
elif [[ $1 == "--help" ]]; then
  echo "Dostępne opcje:"
  echo "--date: Wyświetla aktualną datę."
  echo "--logs [liczba]: Tworzy określoną liczbę plików logx.txt, gdzie x to numer pliku."
else
  echo "Nieprawidłowa opcja. Użyj --help, aby wyświetlić dostępne opcje."
fi