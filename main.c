#include <stdio.h>
#include <string.h>

void encryptDecrypt(char *input, char *output) {
	char key[] = {'K', 'C', 'Q'}; //Can be any chars, and any size array
	
	int i;
	for(i = 0; i < strlen(input); i++) {
		output[i] = input[i] ^ key[i % (sizeof(key)/sizeof(char))];
	}
}

int main (int argc, char *argv[]) {

	char dir[255];
	if(argc < 2)
		strcpy(dir,"/mnt/usbDrive");
	else{
		strcpy(dir,argv[1]);
	}
	char filenameIn[255];
	strcat(filenameIn,dir);
	strcat(filenameIn,"/toCrypt");

	char filenameOut[255];
	strcat(filenameOut,dir);
	strcat(filenameOut,"/encrypted.xor");

	FILE *fileIn = fopen(filenameIn,"r");
	printf("toCrypt opened\n");
	FILE *fileEncrypted = fopen(filenameOut,"w");
	printf("encripted.xor created\n");
	if(fileIn!=NULL){

		char line[128];
		char encrypted[strlen(line)];
		char decrypted[strlen(line)];

		while(fgets(line, sizeof line, fileIn)!=NULL){
			encryptDecrypt(line, encrypted);
			printf("encrypting file...\n");
			//printf("%s", decrypted);
			fprintf(fileEncrypted,"%s", decrypted);		
		}

		fclose(fileIn);
		fclose(fileEncrypted);
	}else{
		perror(filenameIn);
	}
	return 0;
}
