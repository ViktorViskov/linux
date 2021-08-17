
# load info about ram
RAM=`free -m | grep 'Память' | awk '{print $3}'`

# info about cpu
CPU_Temp=`sensors | grep 'Tdie' | awk '{print $2}'`
CPU_Freq_Current="`lscpu | grep 'CPU МГц' | awk '{printf "%.1f", $3/1000}'`GHz"
CPU_Freq_Max="`cat /etc/tlp.conf | grep CPU_SCALING_MAX_FREQ_ON_BAT | awk -F'=' '{printf "%.1f", $2 / 1000000}'`GHz"
CPU_Turbo=`cat /etc/tlp.conf | grep CPU_BOOST_ON_BAT | awk -F'=' '{print $2}'`
Battery_Safe=`cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode`
Up_Time=`uptime -p | uptime -p | awk '{printf "%d:", $2; printf "%02d", $4}'`

# cpu turbo boost logick
if [ $CPU_Turbo = '0' ]; then
    CPU_Turbo="<span weight=\"bold\" fgcolor=\"Green\">Turbo OFF</span>"
else
    CPU_Turbo="<span weight=\"bold\" bgcolor=\"Green\">Turbo ON</span>"
fi

# battery safe mode logick

if [ $Battery_Safe = '0' ]; then
    Battery_Safe="<span weight=\"bold\" fgcolor=\"Black\" bgcolor=\"#E9967A\">Battery Save OFF</span>"
else
    Battery_Safe="<span weight=\"bold\" fgcolor=\"#E9967A\">Battery Save ON</span>"
fi

# print result
echo "<txt><span weight=\"bold\" fgcolor=\"Green\">CPU $CPU_Temp</span><span weight=\"bold\" fgcolor=\"Orange\"> $CPU_Freq_Current</span><span weight=\"bold\" fgcolor=\"Red\"> $CPU_Freq_Max </span>$CPU_Turbo<span weight=\"bold\" fgcolor=\"Cyan\"> RAM $RAM </span>$Battery_Safe<span> UP $Up_Time</span></txt>"
