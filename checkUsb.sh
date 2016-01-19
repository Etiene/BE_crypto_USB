#!/bin/bash
FILE="/dev/sdb1"

while [ true ]
	do
	if [ -b $FILE ];
	then
		echo "File $FILE exists."
	else
		echo "File $FILE does not exist."
	fi
	sleep 1
	done
