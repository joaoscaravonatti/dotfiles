#!/bin/bash

WALLPAPERS="/home/joao/Pictures/Wallpapers"
CURRENT_WALLPAPER=0

while true; do	
  FILES=($(ls "$WALLPAPERS"))
  LENGTH=${#FILES[@]}
  let MAX_INDEX=LENGTH-1
  IMAGE=${FILES[CURRENT_WALLPAPER]}
  IMG_PATH="$WALLPAPERS/$IMAGE"

  swww img --transition-duration 1 "$IMG_PATH"

  if [[ "$CURRENT_WALLPAPER" -lt "$MAX_INDEX" ]]; then
    let CURRENT_WALLPAPER=CURRENT_WALLPAPER+1
  else
    CURRENT_WALLPAPER=0
  fi

  sleep 60
done
