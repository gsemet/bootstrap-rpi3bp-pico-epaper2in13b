# bootstrap-rpi3bp-pico-epaper2in13

Bootstrap your Raspberry Pi 3B+ using a PIco UPS hat and a WaveShare 2.13in epaper B hat.

You need to connect your RPi with an ethernet cable.

This will configure the Rpi for the following basis configuration

- Fr keyboard
- PIco UPS
- Waveshare 2.13 inch epaper screen Hat (B)

## Without keyboard and screen

- after flash, reinsert the sd card and add a file named `ssh` in `/boot` partition
- Log on your router to find the IP of the raspberry pi in your ethernet DHCP

## If you have a screen and a keyboard

- Please boot on a fresh raspbian
- Please note the IP
- Login as 'pi', password 'raspberry' (QWERTY keyboard)
- execute sudo raspi-config
- In Interfacing, enable SSH, then reboot with 'sudo reboot'.
  Or execute `sudo raspi-config nonint do_ssh 0`

## Set up the Rpi

- Remote from your computer with:
- ssh pi@192.168.0.x
- Then execute

wget --no-check-certificate https://raw.github.com/gsemet/bootstrap-rpi3bp-pico-epaper2in13b/master/install-env.sh -O - | bash
