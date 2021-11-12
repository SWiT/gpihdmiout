#!/bin/bash

echo "Disable HDMI output."
echo "Install GPi CASE LCD display patch."

ORG="/boot/config.txt"
BACKUP="/boot/GPi_Case_patch/original_files/config.txt"
if [ -f "$BACKUP" ]; then		
	: #echo "Backup config.txt already exists."
else
	sudo cp $ORG $BACKUP
fi

ORG="/boot/overlays/dpi24.dtbo"
BACKUP="/boot/GPi_Case_patch/original_files/overlays/dpi24.dtbo"
if [ -f "$BACKUP" ]; then
	: #echo "Backup dpi24.dtbo already exists."
else
	sudo cp $ORG $BACKUP
fi

sudo cp /boot/GPi_Case_patch/patch_files/config.txt /boot/config.txt
sudo cp /boot/GPi_Case_patch/patch_files/overlays/dpi24.dtbo /boot/overlays/dpi24.dtbo
sudo cp /boot/GPi_Case_patch/patch_files/overlays/pwm-audio-pi-zero.dtbo /boot/overlays/pwm-audio-pi-zero.dtbo
echo "Done."

echo
echo "***************" 
echo
echo "Power off the GPi Case." 
echo "Disconnect the HDMI cable."
echo "Then turn it back on."
echo
echo "***************"
echo
if [ "$1" != "-y" ]; then
    read -p "Any key to continue..."
fi
