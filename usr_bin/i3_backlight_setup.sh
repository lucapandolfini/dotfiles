#!/bin/sh -
chmod 666 /sys/class/backlight/intel_backlight/brightness
echo 4700 > /sys/class/backlight/intel_backlight/brightness
