# gpihdmiout
Scripts for modifying a GPi Case running Retropie to enable HDMI output.

Clone the scripts into /home/pi
```
$ git clone https://github.com/SWiT/gpihdmiout.git
```

Add the HDMI detection script to rc.local before "exit 0".
```
$ sudo nano /etc/rc.local
    sudo /home/pi/gpihdmiout/gpi_display_detect.sh
```
