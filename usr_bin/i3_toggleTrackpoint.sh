#!/bin/bash

# 13 is the id of the trackpoint
# This came from running xinput --list
# The output of xinput --list-props for these devices:
# $ xinput --list-props 13
# Device 'TPPS/2 IBM TrackPoint':
#       Device Enabled (132):   1
#       Coordinate Transformation Matrix (134): 1.000000, 0.000000...
#       Device Accel Profile (260):     0
#       Device Accel Constant Deceleration (261):       1.000000
#       Device Accel Adaptive Deceleration (262):       1.000000
#       ...

# So this gives us 1 or 0 depending on the enabled state:
mode=`xinput --list-props "TPPS/2 IBM TrackPoint" | grep "Device Enabled" | cut --fields=3`

if test 1 = $mode; then
  newmode=0
else
  newmode=1
fi

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 8 $newmode

