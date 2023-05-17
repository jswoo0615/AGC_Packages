#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential  -y

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update

sudo ubuntu-drivers autoinstall

sudo reboot

exit 0