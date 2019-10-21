# gpihdmiout
Scripts for modifying a GPi Case running Retropie to enable HDMI output. The HDMI output and LCD screen can not both be enabled at the same time. These scripts will add Retropie menu options to Enable or Disable HDMI after powering off.  If a HDMI cable is not detected on boot the scripts with disable HDMI, enable the LCD, and reboot.

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

Add Retropie Menu to Enable HDMI.
```
$ ln -s /home/pi/gpihdmiout/enable.sh /home/pi/RetroPie/retropiemenu/"HDMI Output Enable.sh"
$ ln -s /home/pi/gpihdmiout/disable.sh /home/pi/RetroPie/retropiemenu/"HDMI Output Disable.sh"
```
