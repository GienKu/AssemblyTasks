#include <stdio.h>


//TASK1
//Search maximum negative number in array.
int max_negative(int* arr, int N);

//TASK2
//Count how many numbers in int array have lowest (or highest) byte set to 0.
int lowest_byte_num(int* arr, int N);

//TASK3
//Remove digits from string. "H3l00" -> "Hl"
void remove_digits(char* str);

//TASK4
//Convert integer
void int2hexstr(int num,char* table, char* hexstr);


int main()
{
	int arr[5] = {10,-2, -40, 123, 14};
	printf("Max negative %d\n", max_negative(arr, 5));

	int arr2[5] = {0x11111111, 0x00000011, 0x11100022, 0x01110022, 0x00111122};
	printf("lowest %d\n", lowest_byte_num(arr2, 5));

	char str[] = "Hell0 pr0gr4amm3r5";
	remove_digits(str);
	printf("Remove digits %s\n", str);

	char hexstr[] = "aaaaaaaa";
	char table[] = "0123456789ABCDEF";
	int2hexstr(0xB23A567,table, hexstr);
	printf("Hex string %s\n", hexstr);



}