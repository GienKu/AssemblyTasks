#include <stdio.h>
#include <string.h>

int div_intN_int32( int *t_num, int t_div, int t_N ); // t_num /= t_div
void add_intN_int32( int *t_num, int t_add, int t_N ); // t_num += t_add
void mul_intN_int32( int *t_num, int t_mul, int t_N ); // t_num *= t_mul

int is_intN_zero( int *t_num, int t_N )
{
    for ( int i = 0; i < t_N; i++ )
        if ( t_num[ i ] != 0 ) return 0;
    return 1;
}

void intN2str( int *t_num, int t_N, char *t_str )
{
    int l_num[ t_N ];
    memcpy( l_num, t_num, sizeof( l_num ) );

    int inx = 0;
    while ( !is_intN_zero( l_num, t_N ) )
    {
        t_str[ inx ] = div_intN_int32( l_num, 10, t_N ) + '0';
        inx++;
    }
    t_str[ inx ] = 0;
    //mirror
    // TASK 1
    int k = 0;
    char temp;
    for(int i = 0, j = strlen(t_str) - 1; i != j; i++,j--) {
        temp = t_str[i];
        t_str[i] = t_str[j];
        t_str[j] = temp;
    }
    
}

void int2str( int t_num, char *t_str )
{
    int inx = 0;
    while ( t_num )
    {
        t_str[ inx ] = t_num % 10 + '0';
        t_num /= 10;
        inx++;
    }
    t_str[ inx ] = 0;
}

void str2intN( char *t_str, int *t_num, int t_N )
{
    int inx = 0;
    memset( t_num, 0, sizeof( int ) * t_N ); // t_num = 0
    while ( t_str[ inx ] != 0 )
    {
        mul_intN_int32( t_num, 10, t_N );
        add_intN_int32( t_num, t_str[ inx ] - '0', t_N );
        inx++;
    }
}

int str2int( char *t_str )
{
    int inx = 0;
    int res = 0;
    while ( t_str[ inx ] != 0 )
    {
        res *= 10;
        res += t_str[ inx ] - '0';
        inx++;
    }
    return res;
}

#define N 4

void print_intN( char *t_msg, int *t_num, int t_N )
{
    printf( "%s: ", t_msg );
    for ( int i = 0; i < t_N; i++ )
        printf( "%08X ", t_num[ t_N - i - 1 ] );
    printf( "\n" );
}

int main5()
{
    int l_num1[ N ];
    char snum[ 128 ] = "100000000000000000000000000000000000";
    str2intN( snum, l_num1, N );
    print_intN( "test", l_num1, N );
    intN2str( l_num1, N, snum );
    printf( "snum %s\n", snum );
    return 0;
}

int main4()
{
    int l_num1[ N ] = { 0xFFFFFFFF, 0x5AFEBEEF, 0x00CACA00, 0x5AFECAFE };
    print_intN( "test", l_num1, N );
    mul_intN_int32( l_num1, 16, N );
    print_intN( "mul", l_num1, N );
    return 0;
}

int main112()
{
    int l_num1[ N ] = { 0xFFFFFFFF, 0x5AFEBEEF, 0x00CACA00, 0x5AFECAFE };
    int l_num2[ N ] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x00FFFFFF };
    print_intN( "test1", l_num1, N );
    add_intN_int32( l_num1, 1, N );
    print_intN( "add", l_num1, N );
    print_intN( "test2", l_num2, N );
    add_intN_int32( l_num2, 1, N );
    print_intN( "add", l_num2, N );
    return 0;
}

int main55()
{
    int l_num1[ N ] = { 0xFFFFFFFF, 0x5AFEBEEF, 0x00CACA00, 0x5AFECAFE };
    print_intN( "test", l_num1, N );
    int rem = div_intN_int32( l_num1, 65536, N );
    print_intN( "div", l_num1, N );
    printf( "rem %X\n", rem );
    return 0;
}

int main0()
{
    char l_str[ 128 ];
    int2str( 123456, l_str );
    printf( "int2str %s\n", l_str );
    printf( "str2int %d\n", str2int( l_str ) );
    return 0;
}
// TASK 3
int main() {
    int numOfBits = 34204;
    int n = 1070;
    unsigned int bigN[n];
    memset( bigN, 0, sizeof( int ) * n );
    bigN[0] = 1;
    for (int i = 2; i <= 3333; i++)
    {
        mul_intN_int32(bigN,i,n);
    }
    char snum[11000];
    intN2str( bigN, n, snum );
    printf( "snum %s\n", snum );
    

}