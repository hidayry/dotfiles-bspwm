#!/usr/bin/env bash

# Function to capture a screenshot with a timer
capture_with_timer() {
    local timer=$1
    sleep $timer && scrot "$HOME/Pictures/ss/$(date +%Y-%m-%d_%H-%M-%S).png"
    notify "Screenshot captured with timer!"
}

# Function to capture a fullscreen screenshot
capture_fullscreen() {
    scrot "$HOME/Pictures/ss/$(date +%Y-%m-%d_%H-%M-%S).png"
    notify "Fullscreen screenshot captured!"
}

# Function to capture a selected area screenshot
capture_selected_area() {
    scrot -s "$HOME/Pictures/ss/$(date +%Y-%m-%d_%H-%M-%S).png"
    notify "Selected area screenshot captured!"
}

# Function to display a notification
notify() {
    dunstify -a "Screenshot Script" -u low -i screenshot-symbolic "$1"
}
if ! [ -d "$HOME/Pictures/ss/" ]; then
    mkdir -p ~/Pictures/ss/
fi

# Prompt the user to select a screenshot option
option=$(printf "Capture with Timer\nFullscreen\nSelected Area" | rofi -dmenu -i -theme "/home/ryan/.config/bspwm/scripts/ss.rasi")

# Perform the corresponding action based on the selected option
case $option in
    "Capture with Timer")
        timer=$(rofi -dmenu -i -theme "/home/ryan/.config/bspwm/scripts/ss_time.rasi")
        capture_with_timer $timer
        ;;
    "Fullscreen")
        capture_fullscreen
        ;;
    "Selected Area")
        capture_selected_area
        ;;
esac
