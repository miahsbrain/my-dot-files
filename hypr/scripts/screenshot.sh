#!/bin/bash

# Create the Pictures directory if it doesn't exist
mkdir -p ~/Pictures

# Take the screenshot based on argument
case $1 in
area)
    grim -g "$(slurp)" - | wl-copy
    notify-send "Screenshot" "Area copied to clipboard!"
    ;;
full)
    grim - | wl-copy
    notify-send "Screenshot" "Full screen copied to clipboard!"
    ;;
area-save)
    filename="$HOME/Pictures/Screenshot_$(date +'%Y-%m-%d-%H%M%S').png"
    grim -g "$(slurp)" "$filename"
    notify-send "Screenshot" "Area saved to:\n$filename"
    ;;
full-save)
    filename="$HOME/Pictures/FULL_Screenshot_$(date +'%Y-%m-%d-%H%M%S').png"
    grim "$filename"
    notify-send "Screenshot" "Full screen saved to:\n$filename"
    ;;
esac
