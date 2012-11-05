#!/bin/bash
echo $1 > /sys/class/backlight/pwm-backlight/brightness
