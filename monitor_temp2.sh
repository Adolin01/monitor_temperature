#!/bin/bash

#Set the temperature thresholds for high and low limits
HIGH_THRESHOLD=70
WARNING_THRESHOLD=65

#Infinite loop to continiously monitor cpu temperature
while true; do 
	#Get the CPU temperature using vcgencmd and extract only the numeric part
	TEMP=$(vcgencmd measure_temp | sed -n 's/[^0-9]*\([0-9]\+\).*/\1/p')
	
	#check if the temperature is above the high threshold
	if [ "$TEMP" -ge "$HIGH_THRESHOLD" ]; then
		
		#display an error message if the temperature is too high 
		zenity --error --text="CPU Temperature is too high!\nCurrent temperature: $TEMP°C"
	
	#check if the temperature is above the low limit
	elif [ "$TEMP" -ge "$WARNING_THRESHOLD" ]; then

		#display a warning message if the temperature is almost too high	
		zenity --error --text="Careful. CPU Temperature is almost too high!\nCurrent temperature: $TEMP °C"

	fi 
	#how long the script waits before checking again
	sleep 30

done
