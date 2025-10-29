#!/bin/bash

file=~/pass.txt
keys=$(cut -d',' -f1 "$file")
selected_key=$(echo "$keys" | rofi -theme ~/.config/rofi/clipboard.rasi -i -dmenu -p "")

if [[ -n $selected_key ]]; then
  value=$(grep "^$selected_key," "$file" | cut -d',' -f2)
  
  if [[ -n $value ]]; then
    echo -n "$value" | wl-copy
  fi
fi
