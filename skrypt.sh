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
else
  echo "Nieprawidłowa opcja. Użyj --date, aby wyświetlić aktualną datę lub --logs [liczba], aby utworzyć określoną liczbę plików logx.txt."
fi
