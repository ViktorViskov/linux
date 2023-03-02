#!/usr/bin/sh
pactl set-sink-volume @DEFAULT_SINK@ -10%
notify-send -i none -r 1 -t 1500 "Sound: `pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'`"