#!/bin/bash

# Check if config.txt is the patched copy.
# Toggle it to the other state.
PATCHED=$(diff /boot/GPi_Case_patch/patch_files/config.txt /boot/config.txt)
if [ "$PATCHED" == "" ]; then
    /home/pi/gpihdmiout/enable.sh
else
    /home/pi/gpihdmiout/disable.sh
fi
