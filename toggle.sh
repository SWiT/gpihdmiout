#!/bin/bash

# Check current state
# Toggle it to the other state.
DIFF=$(diff /boot/GPi_Case_patch/patch_files/config.txt /boot/config.txt)
if [ $DIFF == "" ]; then
    echo "GPi CASE LCD is enabled."
else
    echo "HDMI is enabled."
fi