#!/bin/bash

if [ -e ~/.config/i3/backlight_store ]; then
new_brightness=$(cat ~/.config/i3/backlight_store)
rm ~/.config/i3/backlight_store
else
new_brightness=0
cat /sys/class/backlight/intel_backlight/brightness >  ~/.config/i3/backlight_store
fi
echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
