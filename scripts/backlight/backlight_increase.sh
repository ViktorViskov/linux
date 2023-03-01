#!/usr/bin/sh
light -A 5
notify-send -i /usr/share/icons/Adwaita/16x16/status/software-update-available-symbolic.symbolic.png -r 1 -t 1500 `light -G`