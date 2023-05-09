#!/bin/bash

if [[ $1 == "--date" ]]; then
  date
elif [[ $1 == "--logs" ]]; then
  for ((i=1; i<=100; i++))
  do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Nazwa skryptu: $0" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done
else
  echo "Nieprawidłowa opcja. Użyj --date, aby wyświetlić aktualną datę lub --logs, aby utworzyć 100 plików logx.txt."
fi
