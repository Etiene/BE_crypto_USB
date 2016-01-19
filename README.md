# BE Éxecution et concurrence

BE pour la discipline d'éxecution et concurrence à ENSTA Bretagne.

##Description
Script to verify USB drive connecting to Armadeus board, mounting and warning the user after unmounting if they can remove the thumb drive through blinking leds

##Install instructions

* Clone the contents of this directory on your computer
* Make modifications to `copyToBoard.sh`, such as altering the IP address of the board, if necessary
* Run `sh copyToBoard.sh` to copy all the necessary files to the board
* Run `sync` on minicom to sync files on the board so they are still there after the reboot
* Reboot the board

##Authors
* [David Duverger](https://github.com/DavidDUVERGER)
* [Etiene da Cruz Dalcol](https://github.com/Etiene)
* [Rafael Finkelstein](https://github.com/Finkelrf)
* [Thiago Oliveira](https://github.com/thiagoliveira)


##License
[MIT](https://github.com/Etiene/BE_crypto_USB/blob/master/README.md)
