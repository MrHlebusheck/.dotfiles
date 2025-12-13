#!/bin/zsh

output=$(hyprctl monitors -j | jq -r '.[] | "\(.id) \(.name) \(.model)"')
lines_count=$(echo $output | wc -l)

if [ $lines_count -eq 2 ]; then
  hyprctl keyword monitor "HDMI-A-1, preferred, auto, 1"
  hyprctl keyword monitor "eDP-1, preferred, auto-center-down, 1"
else 
  hyprctl keyword monitor "eDP-1, preferred, auto, 1"
fi

hyprctl keyword monitor ", preferred, auto-center-right, 1"
