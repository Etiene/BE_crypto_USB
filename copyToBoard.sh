BOARDIP="172.20.13.41"
FILE="checkUsb.sh"
FILE_TO_COMPILE="encrypter"
INIT_FILE="S99usbCheck"

chmod +x $FILE
scp $FILE root@$BOARDIP: 
chmod +x $INIT_FILE
scp $INIT_FILE root@$BOARDIP:/etc/init.d/
echo "Compiling ..."
~/workspace/armadeus/armadeus-trunk/buildroot/output/host/usr/bin/arm-linux-gcc -o $FILE_TO_COMPILE main.c
scp $FILE_TO_COMPILE root@$BOARDIP: