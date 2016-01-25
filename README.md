# BE Éxecution et concurrence

BE pour la discipline d'éxecution et concurrence à ENSTA Bretagne.

##Description
This program works along an Armadeus board to encrypt and decrypt files in a USB drive.

##Install instructions

* Clone the contents of this directory on your computer
* Make modifications to `copyToBoard.sh`, such as altering the IP address of the board, if necessary
* Run `sh copyToBoard.sh` to copy all the necessary files to the board
* Run `sync` on minicom to sync files on the board so they are still there after the reboot
* Reboot the board

##Usage
* Follow the install instructions
* A LED on the board will be blinking regularly to indicate that the program is running and ready
  * If the LED is not blinking please recheck the install instructions or contact one of the main project authors listed below
* Insert your USB flash drive containing the file(s) to be crypted or decrypted on the board  
  * If there is a file to be encrypted, it should specifically be named `toCrypt`
  * If there is a file to be decrypted, it should specifically be named `toDecrypt.xor`
* The program will do all the necessary computations and warn you that the USB drive is ready to be removed by quickly blinking the LED 3 times and then stop the blinking
* Now you can safely remove the USB drive
  * The USB drive will now contain additional files:
    * Either one called `crypted.xor`, which is the crypted version of the `toCrypt`file
    * Or one called `decrypted`, which is the decrypted version of the `toDecrypt.xor`file
    * (Or both)
* The LED on the board will restart blinking regularly to indicate that the program is ready again
  * You can repeat the process with more USB flash drives, if desired


##Authors
* [David Duverger](https://github.com/DavidDUVERGER)
* [Etiene da Cruz Dalcol](https://github.com/Etiene)
* [Rafael Finkelstein](https://github.com/Finkelrf)
* [Thiago Oliveira](https://github.com/thiagoliveira)


##License
[MIT](https://github.com/Etiene/BE_crypto_USB/blob/master/README.md)
