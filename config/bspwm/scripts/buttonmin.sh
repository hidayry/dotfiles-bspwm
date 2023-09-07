#!/bin/bash

# by github : https://github.com/hidayry/dotfiles-bspwm

current_state=$(bspc query -N -n focused.tiled)

if [ -z "$current_state" ]; then
    bspc node -f focused.pseudo_tiled
    bspc node -t tiled
else
    bspc node -f focused.tiled
    bspc node -t pseudo_tiled
fi
