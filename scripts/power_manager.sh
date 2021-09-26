#!/usr/bin/sh

# default time for waiting
default_pause=$1
step_time=30

#chech for value
if [ ! $default_pause ]
then
    default_pause=60
fi

# variable for counting
pause=$default_pause

# main loop
while [ true ]
do
    monitor_status=`/usr/bin/xset -q | /usr/bin/grep 'Monitor is' | /usr/bin/awk '{print $3}'`
    if [ $monitor_status != 'On' ]
    then
        if [ $pause -le 0 ]
        then
            # new sleep counter
            pause=$default_pause
            
            # sleep command
            systemctl suspend-then-hibernate
        else
            pause=`expr $pause - $step_time`
        fi
    else
        # new sleep counter
        pause=$default_pause
    fi

    # step pause
    sleep $step_time
done