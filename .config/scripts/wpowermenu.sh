#!/bin/bash

options=" ⏻ \n  \n  \n 󰒲 "

chosen=$(echo -e "$options" | wofi -c ~/.config/wofi/power.conf -s ~/.config/wofi/power.css --dmenu --title "Power Menu")

case $chosen in
    " ⏻ ")
        shutdown now
        ;;
    "  ")
        reboot
        ;;
    "  ")
        hyprlock 
        ;;
    " 󰒲 ")
      hyprlock & (sleep 1 && systemctl sleep)
        ;;
    *)
        exit 0
        ;;
esac
