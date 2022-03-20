#!/usr/bin/sh

# load connection status
status_string=`mount | grep 10.0.0.2:/nfs/dev`

if [ "$status_string" = "" ] 
then
    sudo mount 10.0.0.2:/nfs/dev /mnt
    echo "'/nfs/dev' Mounted"
else
    sudo umount /mnt -l
    echo "'/nfs/dev' Unmounted"
fi