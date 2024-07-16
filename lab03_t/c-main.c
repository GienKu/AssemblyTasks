#include <stdio.h>


//TASK1
//Find positive mininum number in array.
int positive_min(int* arr, int N);

//TASK2
//Count how many numbers in array have four lowest bits set to 0.
int lowest4bits(int* arr, int N);

//TASK3
//Compute sum of digits in string. "Pr0gr4m3r5!" -> 12
int sum_digits(char* str);

//TASK4
//Remove from array all negative numbers.
int remove_negatives(int* arr, int N);

//TASK5
//Convert hex str to int
int hexstr2int(char* hexstr);


int main()
{
	//T1
	int arr[5] = {250,-2, -40, 1, 14};
	printf("Positive min: %d\n", positive_min(arr, 5));
	//T2
	int arr2[5] = {0x11111100, 0x00000000, 0x11100000, 0x01110000, 0x00111111};
	printf("Lowest 4 bits: %d\n", lowest4bits(arr2, 5));
	//T3
	char str[] = "Pr0gr4m3r5!";
	int sum = sum_digits(str);
	printf("Sum digits: %d\n", sum);
	//T4
	int arr3[5] = {250,-2, -40, 1, 14};
	int len = remove_negatives(arr3, 5);
	for (int i = 0; i < len; i++)
	{
		printf(" %d\t", arr3[i]);
	}
	
	//T5
	char hexstr[] = "B23A5670";
	
	printf("\nHex int %X\n", hexstr2int(hexstr));



}