#!/bin/bash

sudo apt-get update
sudo apt-get install -y vim tmux git

sudo update-grub

sudo nvidia-xconfig -a --cool-bits=28 --enable-empty-initial-configuration

sudo systemctl restart lightdm.service

