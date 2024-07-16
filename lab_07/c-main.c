#include <stdio.h>
#include <string.h>

// TASK 1
// Count sum of int array without overflow.
long long sum(int *arr, int N);
// TASK 2
// Count factorial long factorial( int N ). When overflow, then return 0.
long long factorial(int n);
// TASK 3
// Search max and min void minmax( long *t_array, int N, long *min, long *max );
void minmax( long long *t_array, int N, long long *min, long long *max );
// TASK 4
// Count how many even digits is in string.
int c_even_digits(char* str);
// TASK 5
// Prime factorization for 2, 3, 5, 7, 11. int factorization( long N, char *primes );
int factorization( long N, char *primes );


main()
{
    // TASK 1
    int arr[] = {1000000001,1000000000,1000000000,1000000001};
    printf("Sum of arr: %lld ", sum(arr,4));
    // TASK 2
    printf("\nFactorial: %lld ", factorial(100));
    // TASK 3
    long long min, max;
    long long arr2[] = {-3,2,4,5,1,60,7,0,9,-20};
    minmax(arr2,10,&min,&max);
    printf("\nmin: %lld ",min);
    printf("\nmax: %lld ", max);
    // TASK 4
    char str[] = "13579 02 Skoda\0";
    printf("\nEven count: %d \n", c_even_digits(str));
    // TASK 5
    char primes[20];
    int n = factorization(3, primes);
    for(int i = 0; i < n; i++) {
        printf("%d ", primes[i]);
    }
     printf("primes count: %d ", n);

    return 0;
}