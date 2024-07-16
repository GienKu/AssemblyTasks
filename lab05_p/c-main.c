
#include <stdio.h>
#include <string.h>
// TASK 2
// Convert string to upper or lower case according to parameter. str_up_low( char *str, int up_or_down );
void toUpperLower(char* str, int up_or_low);
// TASK 3
// Implement strcmp, see man strcmp. Use length of shorter string. Use cmpsb and then jl/jg/je.
int my_strcmp(char* str1, char* str2);
// TASK 4
// Find how many zeroes is in int array. Repeately use scansd.
int c_zeros(int* arr, int n);
// TASK 5
// Compute sum of numbers: int sum( int a, ... );. Last will be -1. E.g. sum( 1, 2, 4, 5, 6, 7, -1 );. Try use lodsd.
int i_sum(int a, ...);
int main()
{
    // TASK 2 
    char str[] = "012 I am upper CASE";
    toUpperLower(str, 1);
    printf("\nTo upper: %s", str);
    toUpperLower(str, 0);
    printf("\nTo lower: %s", str);

    // TASK 3
    char str1[] = "abcd";
    char str2[] = "abcde";
    printf("\nmy_strcmp: %d", my_strcmp(str1,str2));
    printf("\nstrcmp: %d\n", strcmp(str1,str2));

    // TASK 4
    int arr[] = {1,1,0,0,0,0,1};
    printf("\nZeros: %d\n", c_zeros(arr,7));
    // TASK 5
    printf("\nSum: %d\n", i_sum(1,1,2,3,-1));


    return 0;
}