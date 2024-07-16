#include <stdio.h>
#include <string.h>
// TASK 1
int check_triangle(double a, double b, double c);
// TASK 2
double quadratic( double a, double b, double c, double *x );
// TASK 3
float len_vector( float *vector, int Dim );

int main(){
    // TASK 1
    printf("\nTriangle: %d\n", check_triangle(3,5,10));

    // TASK 2
    double x[2] = {0,0};
    printf("delta = %f\n", quadratic(1,4,4,x));
    printf("x1: %f, x2: %f", x[0], x[1]);
    // TASK 3
    float vec[3] = {123,456,789};
    printf("\nvec len: %f\n", len_vector(vec,3));

    return 0;
}