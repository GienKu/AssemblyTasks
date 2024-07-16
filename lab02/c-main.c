#include <stdio.h>

int xbits = 0x00414293;
int M;

int iarray[10] = { 0, -3, -2, -1, -10, 11, 22, 33, 44, 45};
int max;

char g_str[] = "022233333";
int num;

char carray[] = { -90, -100, -110, 100, -50, 10, 30, 10 };

int xnum = 0x12413240;
char bytee;


void max_even();
void highest_bit();
void count_digits();
void max_byte();
void change_negatives();

int main()
{
	highest_bit();
	printf("Highest bit from left = %d\n",M );

	max_even();
	printf("Max even = %d\n",max );

	count_digits();
	printf("Count Digits = %d\n",num );

	max_byte();
	printf("Max byte = %X\n",bytee );

	change_negatives();
	for(int i = 0; i < 8; i++) {
		printf("%d\t",carray[i] );
	}

}