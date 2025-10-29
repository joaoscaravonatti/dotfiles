#!/bin/bash

poweroff="⏻"
lock="󰍀"
reboot=""
logout="󰍃"
close="󰜺"
time=`date '+%X'`
chosen=$(echo -e "$poweroff\n$reboot\n$lock\n$logout\n$close" | rofi -theme ~/.config/rofi/power.rasi -i -dmenu -p "$time")

case $chosen in
    "$lock")
        hyprlock
        ;;
    "$poweroff")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$logout")
	hyprctl dispatch exit
        ;;
    *)
        exit 1
        ;;
esac
