#xrandr --output Virtual1 --mode 1920x1080
xset dpms 0 300 0
#feh --bg-fill $HOME/.config/background.jpg

dunst &
compton &
xbindkeys
nm-applet &
lxpanel &
lxpolkit &
xfce4-clipman &
#blueman-applet &

exec xfwm4
#exec i3
#exec openbox

#xrdb -merge ~/.Xresources
