#!/usr/bin/env bash

declare -A names=(
  ["alsa_output.pci-0000_00_1f.3.analog-stereo"]="󰽟"
  ["alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"]="󰋎"
  ["alsa_output.usb---_KTMicro_--_Audio_hs_2.0_headset_2024-05-21-0000-0000-0000-00.analog-stereo"]="󰋋"
)

current=$(pactl get-default-sink)
echo "${names[$current]:-🎧}"
