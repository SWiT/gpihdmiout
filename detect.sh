#!/bin/bash

LOG="/home/pi/gpihdmiout/display.log"
HDMIDISABLE="/home/pi/gpihdmiout/disable.sh -y"

TVSTATUS=$(tvservice -s)
# Patched:
#       state 0x400000 [LCD], 320x240 @ 0.00Hz, progressive
# Unpatched, no HDMI at boot:
#   RPi Zero 1
#       state 0x40001 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
#   RPi Zero 2
#       state 0x40000 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
# Unpatched, no HDMI at boot, then HDMI inserted
#   RPi Zero 1
#       state 0x40002 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
#   RPi Zero 2
#       state 0x40000 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
# Unpatched, HDMI at boot:
#   RPi Zero 1
#       state 0x12000a [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive
#   RPi Zero 2
#       state 0xa [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive
# Unpatched, HDMI at boot, then HDMI removed:
#   RPi Zero 1
#       state 0x120009 [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive
#   RPi Zero 2
#       state 0x9 [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive

echo >> $LOG
date >> $LOG
echo $TVSTATUS >> $LOG
TVCODE=$(echo $TVSTATUS | cut -c7-14)
echo "\"$TVCODE\"" >> $LOG
if [ $TVCODE == "0x400000" ]; then
    echo "GPi LCD Enabled. Continue booting." >> $LOG
elif [ $TVCODE == "0x40000" ] || [ $TVCODE == "0x40001" ]; then
    echo "No HDMI connected. Enable GPi LCD, and reboot." >> $LOG
    $HDMIDISABLE >> $LOG
    reboot
else
    echo "HDMI or TV connected? Continue booting." >> $LOG
fi
