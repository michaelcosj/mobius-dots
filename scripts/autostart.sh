#!/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run pipewire # audio deamon
run pipewire-media-session # audio deamon
run pipewire-pulse # pulseaudio replacement
run light-locker --lock-after-screensaver=0 # screen locker
run picom # compositor (for transparency and such)
run unclutter # hide cursor when inactive
run xmodmap ~/.Xmodmap # key remaps (menu to super, capslock to escape)
run /home/michael/dotfiles/scripts/set-touchpad off  # switches off touch pad
