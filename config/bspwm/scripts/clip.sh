#!/usr/bin/env bash

rofi -modi "clipboard:greenclip print" -theme "$HOME/.config/bspwm/scripts/clipboard.rasi" -show clipboard -run-command '{cmd}'
