# lock screen

# create screenshot
scrot /tmp/bg.png

# create blured image
convert /tmp/bg.png -blur 0x8 /tmp/blured_bg.png
i3lock -i /tmp/blured_bg.png

# pause
sleep 1

# suspend mode
systemctl suspend