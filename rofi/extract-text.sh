#!/bin/bash

tmp_image_path="$HOME/Pictures/tmp.png"
grim -g "$(slurp)" "$tmp_image_path"
tessdata_path="/usr/share/tessdata"
languages=$(ls "$tessdata_path" | grep "traineddata" | sed 's/\.traineddata//')
chosen=$(echo -e "$languages" | rofi -theme ~/.config/rofi/clipboard.rasi -i -dmenu -p "Select a language: ")

if [[ -n "$chosen" ]]; then
    tesseract "$tmp_image_path" - -l "$chosen" | wl-copy
fi

rm -f "$tmp_image_path"
