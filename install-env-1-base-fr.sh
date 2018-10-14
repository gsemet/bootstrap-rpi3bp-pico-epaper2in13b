#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

print "set hostname"
read hostname
passwd

sudo apt update -y
sudo apt dist-upgrade
sudo apt-get install -y ntp git i2c-tools bc debhelper vim python-pip

sudo pip install grin

git config --global user.email "gaetan@xeberon.net"
git config --global user.name "Gaetan Semet"

mkdir -p ~/.local/bin

echo "Add the following lines to /etc/fstab"
echo "tmpfs    /var/run    tmpfs    defaults,noatime,nosuid,mode=0755,size=2m    0 0"
echo "tmpfs    /var/spool/mqueue    tmpfs    defaults,noatime,nosuid,mode=0700,gid=12,size=30m    0 0"

pause

# Set Timezone
sudo raspi-config nonint do_change_locale en_US.UTF-8
sudo raspi-config nonint do_configure_keyboard fr
sudo raspi-config nonint do_change_timezone Europe/Paris
sudo raspi-config nonint do_wifi_country fr
sudo raspi-config nonint do_memory_split 16
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_hostname $hostname
sudo reboot
