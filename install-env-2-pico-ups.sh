#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "Use raspi-config to set up you wifi"
sudo raspi-config

echo "Installing deps of PIco UPS drivers..."
# From: https://github.com/modmypi/PiModules/wiki/UPS-PIco-Installation
sudo apt-get install -y python-rpi.gpio python-pip

sudo apt-get install -y git python-dev python-serial python-smbus python-jinja2 python-xmltodict python-psutil python-pip
sudo apt-get -y install git python-dev python-serial python-smbus python-jinja2 python-xmltodict python-psutil python-pip

sudo pip install xmltodict jinja2

cd ~
sudo git clone https://github.com/modmypi/PiModules.git
cd ~/PiModules/code/python/package
sudo python setup.py install
cd ~/PiModules/code/python/upspico/picofssd
sudo python setup.py install
sudo update-rc.d picofssd defaults
sudo update-rc.d picofssd enable
sudo systemctl status picofssd

sudo apt-get install i2c-tools

echo "Make sure the following lines appears in /etc/modules..."
echo "i2c-bcm2708"
echo "i2c-dev"
echo "rtc-ds1307"
pause

sudo vim /etc/modules

echo "Add the following line at the end of /boot/config"
echo "enable_uart=1"
echo "dtoverlay=i2c-rtc,ds1307"
pause

sudo vim /boot/config.txt


echo "Ensure the following files appears, before 'exit 0'"

echo "sleep 4; hwclock -s"
echo "python /home/pi/PiModules/pico_status/pico_status_hv3.0.py"
pause

sudo vim /etc/rc.local

sudo apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove

echo "Command out these 3 lines:"
echo "#if [ -e /run/systemd/system] ; then"
echo "# exit 0"
echo "#fi"
sudo vim /lib/udev/hwclock-set

sudo systemctl daemon-reload
sudo reboot
