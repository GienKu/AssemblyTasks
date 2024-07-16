
#include <stdio.h>
#include <string.h>
// TASK 1
// Implement strlen using recursion.
int my_strlen(char* str);
// TASK 2
// Print sequence of numbers from assembly: print_seq( int start, int stop, int step ); Like > seq 5 8 100
void print_seq( int start, int stop, int step );
// TASK 3
// Bubble sort for intergers.
void bubble_sort(int *arr, int N);
// TASK 4
// How many times is maximum in array.
int count_max(int *arr, int N);
// TASK 5
// Which modulo is in array most times. int modulo( int *array, int N, int Mod ) ; array[ i ] % Mod
int most_common_remainder( int *array, int N, int Mod);

void prnt(int* arr, int N) {
    printf("\n");
    for(int i = 0; i < N; i++){
        printf("Remainder: %d occured: %d \n",i,arr[i]);
    }
}
int main()
{
    // TASK 1
    char str[] = "strlen123456";
    printf("my_strlen %d\n", my_strlen(str));
    printf("strlen %d\n", strlen(str));
    printf("\n");

    // TASK 2
    print_seq(1,10,2);
    printf("\n");

    // TASK 3
    int arr[] = {98,8,72,6,51,4,34,2,12};
    bubble_sort(arr, 9);
    printf("After bubble sort: ");
    for(int i  = 0; i < 9; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");

    // TASK 4
    int arr2[] = {1,10,2,10,3,10,4,10,5,10};
    for(int i  = 0; i < 10; i++) {
        printf("%d, ", arr2[i]);
    }
    printf(" Max count:%d\n\n", count_max(arr2,10));

    // TASK 5
     int arr3[] = {1,2,3,4,5,6,7,8,9,
                    10,11,12,13,14,15,
                     25,35,45,34,43};
    for(int i  = 0; i < 20; i++) {
        printf("%d, ", arr3[i]);
    }
    printf("\nMost common remainder (modulo): %d\n", most_common_remainder(arr3,20,10));

    return 0;
}