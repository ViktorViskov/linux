#!/usr/bin/bash

ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc -crf 50 "$2.mp4"

