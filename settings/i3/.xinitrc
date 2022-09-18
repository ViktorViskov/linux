#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
xrandr -r 165
set_wallpapers.sh &
lxpanel &

exec i3