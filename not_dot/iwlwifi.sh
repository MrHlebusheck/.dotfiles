#!/bin/sh

# Save and make it executable
# /usr/lib/systemd/system-sleep/iwlwifi.sh 

case $1/$2 in
    pre/*)
        systemctl stop NetworkManager
        systemctl stop wpa_supplicant

        modprobe -r iwlmld iwlwifi
        ;;
    post/*)
        modprobe iwlmld iwlwifi

        systemctl start wpa_supplicant
        systemctl start NetworkManager
        ;;
esac

