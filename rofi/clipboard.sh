#!/bin/bash

cliphist list | rofi -theme ~/.config/rofi/clipboard.rasi -dmenu -p "" | cliphist decode | wl-copy
