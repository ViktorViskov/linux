#!/usr/bin/bash

# check for root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

MAX_BATTERY_LEVEL=75

# get battery percentage
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
echo "Battery level: $battery_level% of $MAX_BATTERY_LEVEL%"

# Disable conservation mode if battery is below max level
if [ "$battery_level" -le "$MAX_BATTERY_LEVEL" ]; then
    echo "Battery level is below or equal to $MAX_BATTERY_LEVEL%. Disabling conservation mode."
    echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
fi

# loop if less than max level
while [ "$battery_level" -lt "$MAX_BATTERY_LEVEL" ]; do
    # Add your save work command here
    sleep 60
    battery_level=$(cat /sys/class/power_supply/BAT1/capacity)


    if [ "$battery_level" -gt "$MAX_BATTERY_LEVEL" ]; then
        echo "Battery level is above $MAX_BATTERY_LEVEL%. Conservation mode remains enabled."
        echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    fi
done


