#!/usr/bin/bash

ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc "$2.mp4"

