#!/bin/bash

temp=$(</sys/class/thermal/thermal_zone0/temp)

while true
do
 temp=$(</sys/class/thermal/thermal_zone0/temp)
 temp_f=`echo  "$temp/1000" | bc -l`
 printf  "CPU Temp: %.3f Cº\r\e\e"  $temp_f
 sleep 10
done

