#!/usr/bin/bash
sleep 10
xset dpms 0 300 0
xautolock -time 20 -locker "systemctl suspend"
