BOARDIP="172.20.13.41"
FILE="checkUsb.sh"
ENCRYPTERDECRYPTER="encrypterDecrypter"
INIT_FILE="S99usbCheck"

chmod +x $FILE
scp $FILE root@$BOARDIP: 
chmod +x $INIT_FILE
scp $INIT_FILE root@$BOARDIP:/etc/init.d/

echo "Compiling encrypter..."
~/workspace/armadeus/armadeus-trunk/buildroot/output/host/usr/bin/arm-linux-gcc -o $ENCRYPTERDECRYPTER $ENCRYPTERDECRYPTER.c
scp $ENCRYPTERDECRYPTER root@$BOARDIP:
