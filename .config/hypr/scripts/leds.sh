#!/bin/bash

case "$1" in
mute)
  if [ "$(pamixer --get-volume)" -eq 0 ] || [ "$(pamixer --get-mute)" == "true" ]; then
    brightnessctl -d platform::mute s 1
  else
    brightnessctl -d platform::mute s 0
  fi
  ;;
esac
