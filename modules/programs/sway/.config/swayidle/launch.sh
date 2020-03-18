#!/usr/bin/env bash

pkill swayidle
swayidle -w \
    timeout 600 'swaylock -f' \
    timeout 1200 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -f'
