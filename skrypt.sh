#!/bin/bash

if [[ $1 == "--date" ]]; then
  date
else
  echo "Nieprawidłowa opcja. Użyj --date, aby wyświetlić aktualną datę."
fi
