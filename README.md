# gpihdmiout
**Use these scripts at your own risk.**  These scripts are for a GPi Case running Retropie to enable HDMI output. The HDMI output and LCD screen CAN NOT both be enabled at the same time. These scripts will add Retropie menu options to Enable or Disable HDMI after powering off.  If a HDMI cable is not detected on boot the scripts with disable HDMI, enable the LCD, and reboot.

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

Add Retropie Menu to Enable and Disable HDMI.
```
$ ln -s /home/pi/gpihdmiout/enable.sh /home/pi/RetroPie/retropiemenu/"HDMI Output Enable.sh"
$ ln -s /home/pi/gpihdmiout/disable.sh /home/pi/RetroPie/retropiemenu/"HDMI Output Disable.sh"
```

Restart the GPi Case and you are done.
