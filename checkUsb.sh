#!/bin/bash
FILE="/dev/sda1"
MOUNT_PATH="/mnt/usbDrive"
COUNT=0

while  true 
	do
	if [ -b $FILE ];
	then
		if [ $COUNT -eq 0 ];
		then
			echo "USB drive is connected at $FILE"
			#mount USB drive
			echo "Mounting ... "
			mkdir -p $MOUNT_PATH
			mount $FILE $MOUNT_PATH > /dev/null 2>&1
			echo "Encrypting..." 
			./root/encrypterDecrypter $MOUNT_PATH/toCrypt
			echo "Decrypting..."
			./root/encrypterDecrypter $MOUNT_PATH/toDecrypt.xor
			umount $MOUNT_PATH
			rm -r $MOUNT_PATH
			echo "Unmounted"	
			COUNT=1
			#blink led 3 times
			echo 21 > /sys/class/gpio/export
			echo "out" > /sys/class/gpio/gpio21/direction
			for LOOP in 1 2 3
			do 
				echo 1 > /sys/class/gpio/gpio21/value
				usleep 200000
				echo 0 > /sys/class/gpio/gpio21/value
				usleep 200000
			done

			echo 21 > /sys/class/gpio/unexport
			
		fi
			
	else
		echo 21 > /sys/class/gpio/export
		echo "out" > /sys/class/gpio/gpio21/direction
		echo 1 > /sys/class/gpio/gpio21/value
		usleep 500000
		echo 0 > /sys/class/gpio/gpio21/value
		usleep 500000
		echo 21 > /sys/class/gpio/unexport
		COUNT=0
	fi
	sleep 1
	done
