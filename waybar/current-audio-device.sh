#!/usr/bin/env bash

declare -A names=(
  ["alsa_output.pci-0000_00_1f.3.analog-stereo"]="󰽟 Interno"
  ["alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"]="󰋎 HyperX"
  ["alsa_output.usb---_KTMicro_--_Audio_hs_2.0_headset_2024-05-21-0000-0000-0000-00.analog-stereo"]="󰋋 KZ"
)

current=$(pactl get-default-sink)
echo "${names[$current]:-🎧 Desconhecido}"
