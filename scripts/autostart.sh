#!/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# audio stuff
run pipewire # audio deamon
run pipewire-media-session # audio deamon
run pipewire-pulse # pulseaudio replacement

# session and login stuff
run light-locker --lock-after-screensaver=0 # screen locker

# display stuff
run picom # compositor (for transparency and such)
run ~/.fehbg # wallpaper

# input stuff
run unclutter # hide cursor when inactive
run xmodmap ~/.Xmodmap # key remaps (menu to super, capslock to escape)
run /home/michael/dotfiles/scripts/set-touchpad off  # deactivates touchpad (it suffers from cursor jump)
run /usr/bin/sxhkd # hotkey deamon for non wm specific keybindings
