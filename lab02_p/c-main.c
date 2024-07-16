#include <stdio.h>

// Preparation

// Search positive minimum in int array.

// How many bits is set to 0 in int variable int xnum = 0x10101010; ( use and and shr ) ( shr and adc ).

// How many digits is in the string.

// Compute sum of numbers without overflow char carray[] = { -90, -100, -110, 100, -50, ... }. Store result into int int_sum.
int g_iarray[11] = {-55, 0, -3, -2, -1, -10, 11, 22, 33, 44, 45};
int g_min;

int xnum = 0x10101010;
int g_bits;

char g_str[] = "0asm123 4 567!89";
int g_digits;

char g_carray[5] = {90, -100, -110, 100, -50};
int int_sum;

void search_positive();
void count_bits();
void count_digits();
void char_sum();

int main()
{
	search_positive();
	printf("Positive min = %d\n", g_min);

	count_bits();
	printf("0 bits = %d\n", g_bits);

	count_digits();
	printf("Digits =  = %d\n", g_digits);

	char_sum();
	printf("Char sum = %d\n", int_sum);
}