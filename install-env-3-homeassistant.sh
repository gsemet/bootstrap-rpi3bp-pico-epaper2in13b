#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y raspberrypi-kernel-headers nmap

sudo pip install --upgrade pip pipenv

# https://alexkychen.wordpress.com/2017/11/09/install-mosquitto-on-raspbian-stretch/
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
sudo apt-get update
cd ~
wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb7u4_armhf.deb
sudo dpkg -i libssl1.0.0_1.0.1t-1+deb7u4_armhf.deb
wget http://ftp.nz.debian.org/debian/pool/main/libw/libwebsockets/libwebsockets3_1.2.2-1_armhf.deb
sudo dpkg -i libwebsockets3_1.2.2-1_armhf.deb
sudo apt-get install mosquitto mosquitto-clients


cd ~
git clone https://gsemet@github.com/gsemet/home-assistant-config homeassistant

cd homeassistant
./install-hass.sh
mkdir -p .venv
pipenv install
