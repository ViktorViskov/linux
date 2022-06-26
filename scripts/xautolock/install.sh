#!/usr/bin/sh
# this script to prepaire PC to xautolock scripts and install in /usr/bin folder

# install packages
apt install -y scrot xautolock imagemagick

# copy scripts
cp screen_power_manager.sh /usr/bin/
cp xautolock_start.sh /usr/bin/
cp xautolock_action.sh /usr/bin/