#!/bin/bash

set -ex

choice=$(echo "Shutdown Reboot Suspend Hibernate Logout" | xargs  -n 1 | rofi -dmenu)

echo "$choice"
if [ $choice = "Shutdown" ]; then
  sudo poweroff
elif [ $choice = "Reboot" ]; then
  sudo reboot
elif [ $choice = "Suspend" ]; then
  loginctl suspend
elif [ $choice = "Hibernate" ]; then
  loginctl hibernate
elif [[ $choice = "Logout" ]]; then
  loginctl terminate-session $XDG_SESSION_ID
fi
