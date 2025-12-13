#!/bin/bash

mapfile -t monitors < <(hyprctl monitors -j | jq -r '.[] | "\(.id)"' | sort -n)

current_id=$(hyprctl activeworkspace -j | jq -r '.monitorID')

for i in "${!monitors[@]}"; do
    if [[ "${monitors[i]}" == "$current_id" ]]; then
        current_index=$i
        break
    fi
done

next_index=$(( (current_index + 1) % ${#monitors[@]} ))
next_monitor=${monitors[$next_index]}

case $1 in
  focus)
    hyprctl dispatch focusmonitor $next_monitor
    ;;
  move)
    hyprctl dispatch movewindow mon:$next_monitor 
    ;;
esac
