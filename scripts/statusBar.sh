#!/usr/bin/bash

# app controll

if [ $1 == "sound+" ]
then
	`amixer sset Master 5%+ unmute`
elif [ $1 == "sound-" ]
then
	`amixer sset Master 5%- unmute`
elif [ $1 == "backlight+" ]
then
	`xbacklight -inc 10%`
elif [ $1 == "backlight-" ]
then
	`xbacklight -dec 10%`
fi

# getting information

# battery
battery=`cat /sys/class/power_supply/BAT0/capacity`

# volume level
volume=`amixer sget Master | grep Left:`
volume=${volume#*[}
volume=${volume%\%*}

# light
light=`xbacklight -get`
light=${light%.*}

# main command
xsetroot -name "Bat $battery% Vol: $volume% Light: $light% Date: `date +%d.%m.%y\ %H:%M`"
