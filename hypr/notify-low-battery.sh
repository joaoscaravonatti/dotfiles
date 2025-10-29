#!/bin/bash

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
  status=$(cat /sys/class/power_supply/BAT1/status)
  alert_lvl=20
  alert_status="Discharging"

  if [[ "$bat_lvl" -le "$alert_lvl" && "$status" == "$alert_status" ]]; then
    notify-send --urgency=critical "Battery Low" "Level: ${bat_lvl}%"
  fi

  sleep 5
done
