#!/bin/bash

LOG="/home/pi/gpihdmiout/display.log"
HDMIDISABLE="/home/pi/gpihdmiout/disable.sh -y"

TVSTATUS=$(tvservice -s)
# Patched:
#       state 0x400000 [LCD], 320x240 @ 0.00Hz, progressive
# Unpatched, no HDMI at boot:
#       state 0x40001 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
# Unpatched, no HDMI at boot, then HDMI inserted
#       state 0x40002 [NTSC 4:3], 720x480 @ 60.00Hz, interlaced
# Unpatched, HDMI at boot:
#       state 0x12000a [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive
# Unpatched, HDMI at boot, then HDMI removed:
#       state 0x120009 [HDMI CEA (16) RGB lim 16:9], 1920x1080 @ 60.00Hz, progressive

echo >> $LOG
date >> $LOG
echo $TVSTATUS >> $LOG
TVCODE=$(echo $TVSTATUS | cut -c7-15)
echo $TVCODE
if [ $TVCODE == "0x400000" ]; then
    echo "Already patched. Continue booting." >> $LOG
elif [ $TVCODE == "0x12000a" ]; then
    echo "Unpatched. HDMI connected. Continue booting." >> $LOG
else
    echo "Unpatched. No HDMI connected. Disable HDMI/enable LCD, and reboot." >> $LOG
    $HDMIDISABLE >> $LOG
    reboot
fi