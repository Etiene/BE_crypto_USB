#!/bin/bash
FILE="/dev/sdb1"

while [ true ]
	do
	if [ -b $FILE ];
	then
		echo "USB drive is connected at $FILE"
	else
		echo "USB drive not found."
	fi
	sleep 1
	done
