#!/usr/bin/bash

# user input

if [ $1 == "dev" ]
then
	echo "1" | sudo -S mount 10.0.0.2:/nfs/dev /m_dev
elif [ $1 == "udev" ]
then
	echo "1" | sudo -S umount 10.0.0.2:/nfs/dev /m_dev
fi
