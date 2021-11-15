#!/bin/bash

# Define the command to disable HDMI and Enable the GPiCase LCD.
HDMIDISABLE="/home/pi/gpihdmiout/disable.sh -y"     

# Run the tvservice command and store the output for parsing.
TVSTATUS=$(tvservice -s)
    
# Kernel v5.10.63+
# Patched:
#       state 0x400000 [LCD], 320x240 @ 0.00Hz, progressive
# Unpatched, no HDMI at boot:
#       state 0x40000 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
# Unpatched, HDMI at boot:
#       state 0xa [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive
#       state 0xa [HDMI DMT (85) RGB full 16:9], 1280x720 @ 60.00Hz, progressive
# Unpatched, HDMI at boot, then HDMI removed:
#       state 0x9 [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive

# Parse the tvservice command output to get just the TV state code.
TVCODE=$(echo $TVSTATUS | cut -c7-14)
if [ $TVCODE == "0x400000" ]; then
    echo "GPi CASE LCD Enabled. Continue booting."
elif [ $TVCODE == "0x40000" ] then
    echo "No HDMI connected. Enable GPi CASE LCD, and reboot."
    $HDMIDISABLE
    reboot
else
    echo "HDMI connected. Continue booting."
fi
