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
elif [ $1 == "lang" ]
then
	current=`setxkbmap -query | grep layout`
	current=${current#* }
	if [ $current == "us" ]
	then
		setxkbmap ua
	elif [ $current == "ua" ]
	then
		setxkbmap dk
	elif [ $current == "dk" ]
	then
		setxkbmap ru
	else
		setxkbmap us
	fi
fi

# getting information

#language
lang=`setxkbmap -query | grep layout`
lang=${lang#*     }

# wifi name
wifi=`nmcli | awk NR==1'{print $4}'`

# ip address
ip=`hostname -I`

# battery
battery=`cat /sys/class/power_supply/BAT0/capacity`

# volume level
volume=`amixer sget Master | grep Left:`
volume=${volume#*[}
volume=${volume%\%*}

# light
light=`xbacklight -get`
light=${light%.*}

#date and time
date=`date +%d.%m.%y`
time=`date +%H:%M`

#cpu temp
temp=`cat /sys/class/thermal/thermal_zone0/temp`
temp=${temp%000*}

# main command
xsetroot -name "$lang | $wifi $ip|  $temp |  $battery% |  $volume%  $light% |  $date  $time"
