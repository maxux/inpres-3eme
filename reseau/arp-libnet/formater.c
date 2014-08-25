#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *format_ipMD(unsigned char *data, char *str) {
	unsigned int i;
	char temp[8];
	
	*str = '\0';
	
	for(i = 0; i < 4;) {
		sprintf(temp, "%d.", data[i++]);
		strcat(str, temp);
	}
	
	str[strlen(str) - 1] = '\0';
	
	return str;
}

char *format_macMD(unsigned char *data, char *str) {
	unsigned int i;
	char temp[8];
	
	*str = '\0';
	
	for(i = 0; i < 6;) {
		sprintf(temp, "%02X:", data[i++]);
		strcat(str, temp);
	}
	
	str[strlen(str) - 1] = '\0';
	
	return str;
}
