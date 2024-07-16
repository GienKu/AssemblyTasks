#include <stdio.h>
char carray[4] = {-11,22,-33,44};
int iarray[4];
int xnum = 0x1A2B3C4D;
char byte0;
char byte1;
char byte2;
char byte3;
char animal[] = "mouse";
int pass[3] = {0x65707573,0x69727072,0x33746176};
char texts[] = "me empty string";
extern void password();
extern void extractBytes();
extern void changeArray();
extern void reverse();
int main()
{
	// TASK 1
	for(int i = 0; i < 4;i++) {
		printf("%d \t",carray[i]);
	}
	printf("\n");
	changeArray();
	for(int i = 0; i < 4;i++) {
		printf("%d \t",iarray[i]);
	}
	printf("\n");
	extractBytes();
	// TASK 2
	printf("%X\n",byte0);
	printf("%X\n",byte1);
	printf("%X\n",byte2);
	printf("%X\n",byte3);
	
	//TASK 3
	reverse();
	for(int i = 0; i < 5;i++) {
		printf("%c",animal[i]);
	}
	//TASK 4
	password();
    
	printf("\n%s\n",texts);
}