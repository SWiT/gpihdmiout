#!/bin/bash

echo 
echo "--- Uninstall GPi Case LCD display patch ---"

ORG="/boot/config.txt"
BACKUP="/boot/GPi_Case_patch/original_files/config.txt"
if [ -f "$BACKUP" ]; then
	sudo cp $BACKUP $ORG
else
	echo "Backup config.txt does not exists."
fi

ORG="/boot/overlays/dpi24.dtbo"
BACKUP="/boot/GPi_Case_patch/original_files/overlays/dpi24.dtbo"
if [ -f "$BACKUP" ]; then	
	sudo cp  $BACKUP $ORG	 
else
	echo "Backup dpi24.dtbo does not exists."
fi

ORG="/boot/overlays/pwm-audio-pi-zero.dtbo"
if [ -f "$ORG" ]; then		
	sudo rm $ORG
fi

echo "Done."
echo "*****"
echo "Power off the GPi Case, connect the HDMI cable, then turn it back on."
echo 
echo "Power on the GPi Case WITHOUT the HDMI cable to revert back to the GPi's LCD screen."
echo "*****"