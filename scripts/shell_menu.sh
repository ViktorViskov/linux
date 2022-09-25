#!/usr/bin/bash
# varible for command names
names=(
    "1"
    "2"
    "3"
)

# varible cor command
commands=(
    "ls"
    "ls -a"
    "ls -lah"
)

#
# main app loop
#

while [ true ]; do
    # clean console
    clear

    # controll message
    echo "ESC: exit"
    echo "1: star dev server"
    echo "2: start prod server"
    echo "3: generate new config file"
    echo "5: install db"
    echo "6: delete db"
    echo "7: install docker"
    echo "8: delete docker"
    echo "9: install project"
    echo "d: delete all settings"

    # read user key
    read -sn 1 key

    # if escape break loop
    if [ "$key" = $'\e' ]; then
        break
    fi

    # dev server
    if [ "$key" = "1" ]; then
        clear
        ${commands[0]}
        break
    fi

done
