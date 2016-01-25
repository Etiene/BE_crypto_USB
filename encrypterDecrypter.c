#include <stdio.h>
#include <string.h>
#include <fcntl.h>

void encryptDecrypt(char *input, char *output) {
	char key[] = {'K', 'C', 'Q'}; //Can be any chars, and any size array
	
	int i;
	for(i = 0; i < strlen(input); i++) {
		output[i] = input[i] ^ key[i % (sizeof(key)/sizeof(char))];
	}
}

int main (int argc, char *argv[]) {;
	printf("ENCDEC 1.1\n");
	char dir[255];
	if(argc < 2)
		strcpy(dir,"/mnt/usbDrive/toCrypt");
	else{
		strcpy(dir,argv[1]);
	}
	char filenameIn[255];
	strcpy(filenameIn,dir);
	printf("%s\n",filenameIn );

	char filenameOut[255];
	if(strcmp(filenameIn,"/mnt/usbDrive/toCrypt") == 0){
		strcpy(filenameOut,"/mnt/usbDrive/crypted.xor");
	}else if(strcmp(filenameIn,"/mnt/usbDrive/toDecrypt.xor") == 0){
		strcpy(filenameOut,"/mnt/usbDrive/decrypted");
	}else{
		strcpy(filenameOut,dir);
		strcat(filenameOut,".xor");
	}
	
	printf("%s\n",filenameOut );


	char buffIn[1024];
	char buffOut[1024];


	close(fopen(filenameOut,"w"));
	int fd1 = open(filenameIn, O_RDONLY);
	int fd2 = open(filenameOut, O_RDWR);

	if(filenameIn!=NULL){
		int bytes = read(fd1, &buffIn, 1024);
		printf("%s\n",buffOut);
		//Crypt:
		encryptDecrypt(buffIn, buffOut);
		write(fd2,&buffOut,bytes);

		close(fd1);
		close(fd2);
	}else{
		//perror(filenameIn);
	}
	return 0;
}
