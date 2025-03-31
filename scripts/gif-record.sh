#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <seconds>"
    exit
fi

current_date=$(date +%d-%m-%Y_%H-%M-%S)
file_name="$current_date.gif"
byzanz-record --duration=$1 --x=0 --y=0 --width=1920 --height=1200 ~/$file_name
