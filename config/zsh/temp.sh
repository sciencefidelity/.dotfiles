#!/bin/bash
# https://www.raspberrypi.org/forums/viewtopic.php?t=252115

temp=$(</sys/class/thermal/thermal_zone0/temp)
temp_f=`echo "$temp/1000" | bc -l`
printf "%.1f°C\n"  $temp_f

