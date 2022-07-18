#!/usr/bin/python3
# libs
from sys import argv

# variables
path = "/sys/class/backlight/intel_backlight"
arg = argv[1] if len(argv) > 1 else "50"

# read britness info
current_brightness = int(open(path + "/brightness").read().replace("\n", ""))
max_brightness = int(open(path + "/max_brightness").read().replace("\n", ""))
target_brightness = int(max_brightness / 100 * int(arg))

# write new data
open(path + "/brightness","w").write(str(target_brightness))