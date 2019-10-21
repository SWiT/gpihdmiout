#!/bin/bash

echo 
echo "--- Uninstall GPi Case display patch ---"

ORG="/boot/config.txt"
BACKUP="/boot/GPi_Case_patch/original_files/config.txt"
if [ -f "$BACKUP" ]; then
	cp $BACKUP $ORG
else
	echo "Backup config.txt does not exists."
fi

ORG="/boot/overlays/dpi24.dtbo"
BACKUP="/boot/GPi_Case_patch/original_files/overlays/dpi24.dtbo"
if [ -f "$BACKUP" ]; then	
	cp  $BACKUP $ORG	 
else
	echo "Backup dpi24.dtbo does not exists."
fi

ORG="/boot/overlays/pwm-audio-pi-zero.dtbo"
if [ -f "$ORG" ]; then		
	rm $ORG
fi

echo "Done."
echo