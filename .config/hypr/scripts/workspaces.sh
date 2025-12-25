#!/bin/bash

case $1 in
init)
  monitors=$(hyprctl monitors -j)
  echo "$monitors" | jq -r '.[] | "\(.id),\(.name)"' | while IFS=',' read -r id name; do
    for i in $(seq 1 10); do
      workspace=$((10 * $id + $i))
      hyprctl keyword workspace "$workspace,monitor:$name"
    done
  done
  for ws in $(hyprctl workspaces -j | jq '.[] .id' | tac); do
    monitor=$((($ws - 1) / 10))
    hyprctl dispatch moveworkspacetomonitor $ws $monitor
  done
  ;;

switch)
  id=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')
  workspace=$((10 * $id + $2))
  hyprctl dispatch workspace $workspace
  ;;

movesilent)
  id=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')
  workspace=$((10 * $id + $2))
  hyprctl dispatch movetoworkspacesilent $workspace
  ;;
esac
