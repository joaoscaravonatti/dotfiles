#!/usr/bin/env bash

devices=($(pactl list short sinks | awk '{print $2}'))

current=$(pactl get-default-sink)

for i in "${!devices[@]}"; do
  if [[ "${devices[$i]}" == "$current" ]]; then
    next_index=$(( (i + 1) % ${#devices[@]} ))
    break
  fi
done

next_sink=${devices[$next_index]}
pactl set-default-sink "$next_sink"

pactl list short sink-inputs | while read -r input; do
  input_id=$(echo "$input" | awk '{print $1}')
  pactl move-sink-input "$input_id" "$next_sink"
done

echo "🎧 $(pactl get-default-sink)"
