#!/bin/bash
FILE="/dev/sda1"
MOUNT_PATH="/mnt/usbDrive"
CHECK=true

while  $CHECK 
	do
	if [ -b $FILE ];
	then
		echo "USB drive is connected at $FILE"
		#mount USB drive
		echo "Mounting ... "
		mkdir -p $MOUNT_PATH
		mount $FILE $MOUNT_PATH
		sleep 2
		umount $MOUNT_PATH
		rm -r $MOUNT_PATH
		CHECK=false	
		#blink led 3 times
		echo 21 > /sys/class/gpio/export
		echo "out" > /sys/class/gpio/gpio21/direction

		for LOOP in 1 2 3
		do 
			echo 1 > /sys/class/gpio/gpio21/value
			usleep 300000
			echo 0 > /sys/class/gpio/gpio21/value
			usleep 300000
		done

		echo 21 > /sys/class/gpio/unexport	
	else
		echo "USB drive not found."
	fi
	sleep 1
	done
