#!/usr/bin/sh
if [ $1 ]
then
	sudo python3 -m http.server $1
else
	sudo python3 -m http.server 80
fi
