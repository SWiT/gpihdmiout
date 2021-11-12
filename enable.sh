#!/bin/bash

echo "Enable HDMI output."
echo "Unstall GPi CASE LCD display patch."

ORG="/boot/config.txt"
BACKUP="/boot/GPi_Case_patch/original_files/config.txt"
if [ -f "$BACKUP" ]; then
	sudo cp $BACKUP $ORG
else
	echo "Backup config.txt does not exists!"
fi

ORG="/boot/overlays/dpi24.dtbo"
BACKUP="/boot/GPi_Case_patch/original_files/overlays/dpi24.dtbo"
if [ -f "$BACKUP" ]; then	
	sudo cp  $BACKUP $ORG	 
else
	echo "Backup dpi24.dtbo does not exists!"
fi

ORG="/boot/overlays/pwm-audio-pi-zero.dtbo"
if [ -f "$ORG" ]; then		
	sudo rm $ORG
fi

echo "Done."
echo
echo "***************"
echo
echo "Power off the GPi Case." 
echo "Connect the HDMI cable."
echo "Then turn it back on."
echo 
echo "Power on the GPi Case "
echo "WITHOUT the HDMI cable to revert "
echo "back to the GPi's LCD screen."
echo
echo "***************"
echo
if [ "$1" != "-y" ]; then
    read -p "Any key to continue..."
fi