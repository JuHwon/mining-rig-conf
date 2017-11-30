#!/bin/bash

# ensure script runs as sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# make envidia-smi settings persistent while system is running
nvidia-smi -pm 1

# disabled leds
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a GPULogoBrightness=0

# repeat this block for every gpu and adjust settings
nvidia-smi -i 0 -pl 200
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=50
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:0]/GPUFanControlState=1
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [fan:0]/GPUTargetFanSpeed=100


nvidia-smi -i 1 -pl 200
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:1]/GPUGraphicsClockOffset[3]=50
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:1]/GPUFanControlState=1
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [fan:1]/GPUTargetFanSpeed=100


