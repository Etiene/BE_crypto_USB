BOARDIP="172.20.13.41"
FILE="checkUsb.sh"
INIT_FILE="S99usbCheck"
chmod +x $FILE
scp $FILE root@$BOARDIP: 
chmod +x $INIT_FILE
scp $INIT_FILE root@$BOARDIP:/etc/init.d/
