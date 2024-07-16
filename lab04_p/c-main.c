
#include <stdio.h>
// TASK 1 - Compute sum of long long array: long long sum_ll( long long *tp_array, int t_N );
long long sum_ll(long long *tp_array, int t_N);

// TASK 2 - Compute sum of int without overflow. (cdq?)
long long sum_ints(int *tp_array, int t_N);
// TASK 3 - Convert long long to string.
void long2str(long long num);
// TASK 4 - Find maximum in long long array.
long long max_long_arr(long long *tp_array, int t_N);
// TASK 5 - Convert hex string to long long hex2longlong( char *tp_str );
long long hex2longlong( char *tp_str );

int main()
{

    // TASK 1
    long long arr[] = {-123456789000000000,-123456788,0};
    printf( "Sum of LL array %Ld\n", sum_ll(arr, 3));

    // TASK 2
    int arr2[] = {0x80000000, -1, -1};
    printf( "Sum of int array %Ld\n", sum_ints(arr2, 3));

    // TASK 3
    // long long num = 123456789123456789;
    // char num_str[20];
    // long2str(num);
    // printf( " %s\n", num_str);

    // TASK 4
    long long arr3[] = {1, 2, 3,1234567881LL,123456789LL,0x7FFFFFFFFFFFFFFFLL};
    printf( "Max of array %Ld\n", max_long_arr(arr3, 6));

    // TASK 5
    char hex_long_str[] = "0x0123456789ABCDEF";
    printf( "Converted hex str %LX\n", hex2longlong(hex_long_str));


}