#!/bin/bash

echo 
echo "--- Install GPi Case LCD display patch ---"

ORG="/boot/config.txt"
BACKUP="/boot/GPi_Case_patch/original_files/config.txt"
if [ -f "$BACKUP" ]; then		
	echo "Backup config.txt already exists."
else
	cp $ORG $BACKUP
fi

ORG="/boot/overlays/dpi24.dtbo"
BACKUP="/boot/GPi_Case_patch/original_files/overlays/dpi24.dtbo"
if [ -f "$BACKUP" ]; then
	echo "Backup dpi24.dtbo already exists."
else
	cp $ORG $BACKUP
fi

cp /boot/GPi_Case_patch/patch_files/config.txt /boot/config.txt
cp /boot/GPi_Case_patch/patch_files/overlays/dpi24.dtbo /boot/overlays/dpi24.dtbo
cp /boot/GPi_Case_patch/patch_files/overlays/pwm-audio-pi-zero.dtbo /boot/overlays/pwm-audio-pi-zero.dtbo

echo "Done."
echo
