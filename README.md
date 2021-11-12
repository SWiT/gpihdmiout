# gpihdmiout
**Use these scripts at your own risk.**  These scripts enable HDMI output on the Retroflag GPi Case running a Raspberry Pi Zero 1 or Zero 2 and Retropie. You will need to cut a hole in the GPi Case Cartridge. The HDMI output and LCD screen CAN NOT both be enabled at the same time. The setup instructions will add a Retropie menu option to Enable and Disable HDMI after powering off.  If a HDMI cable is not detected on boot the script will disable HDMI, enable the LCD, and reboot. This can take 30-60 seconds on a RPiZ2.

## **WARNING**: Do not enable HDMI without completely powering off the GPi Case afterwards. Do not use "sudo reboot" or "sudo poweroff".  Doing so may leave junk displayed on the GPi's LCD screen that can BURN INTO THE SCREEN after only a few minutes. I know this. I did this. The burned in pattern went away after several hours of the unit resting at room temperature. I got lucky.


## Setup
Clone the scripts into /home/pi
```
$ cd /home/pi
$ git clone https://github.com/SWiT/gpihdmiout.git
```

Add the HDMI detection script to rc.local before "exit 0" line.
```
$ sudo nano /etc/rc.local

    sudo /home/pi/gpihdmiout/detect.sh
```

Add Retropie menu option to Enable and Disable HDMI.
```
$ ln -s /home/pi/gpihdmiout/toggle.sh /home/pi/RetroPie/retropiemenu/"HDMI Output Enable & Disable.sh"
```

Restart the GPi Case and you are done.
