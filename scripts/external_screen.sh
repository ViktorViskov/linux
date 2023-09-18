xrandr --output eDP --off
xrandr --output DisplayPort-0 --mode 3840x2160
xrdb -I$HOME ~/.Xresources

xset dpms 0 300 0
