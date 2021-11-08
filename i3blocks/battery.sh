#!/bin/bash

icon_num=5
icon_on="♥"
icon_off="♡"
icon_chg="⚡"

batstat=$(acpi)
batstat=${batstat/Battery\ 0:/}

status=${batstat%,*}
status=${status%,*}
stat=${status:0:2}

if [[ $batstat =~ ([0-9]*\%) ]]; then 
	percentage=${BASH_REMATCH[1]%\%}
else 
	percentage='?'
fi

if [[ $batstat =~ ([0-9][0-9]:[0-9][0-9]:[0-9][0-9]) ]]; then 
	time=${BASH_REMATCH[1]}
else 
	time=''
fi

for i in $(seq 1 ${icon_num});
do
	#thres=$( echo "100*($i)/$icon_num)" | bc )
	thres=$( echo "100*(${i}-0.5)/${icon_num}" | bc )
	if (( $percentage > $thres )); then
		charge+=$icon_on;
	else
		if [[ $i == 1 ]]; then
			charge="╬╬╬╬╬"
			break
		fi

		if [[ $stat == *"C"* ]]; then
			charge+=$icon_chg
		else 
			charge+=$icon_off
		fi
	fi
done

echo "$charge $percentage% $time"
echo "$charge $percentage% $time"

# consider color and urgent flag only on discharge

if (( $percentage < 20 )); then
	color="#FF0000";
elif (( $percentage < 40 )); then
	color="#FFAE00";
elif (( $percentage < 60 )); then
	color="#FFF600";
else 
  	color="#A8FF00";
fi

echo $color

if (( $percentage < 10 )); then
	exit 33 
fi

exit 0
