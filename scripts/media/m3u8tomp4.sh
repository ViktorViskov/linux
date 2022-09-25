#!/usr/bin/bash
# Simple script to load and convert m3u8 to mp4
# For scrept need ffmpeg and 2 arguments.
# 1 Link to m3u8 file
# 2 output file name
ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc -crf 50 "$2.mp4"

