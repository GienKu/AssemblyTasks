//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************

#include <stdio.h>

long long mul_i32i32( int t_a, int t_b );

long long add_i64i64( long long t_a, long long t_b );

long long div_i64i32( long long t_a, int t_b );

long long shr_i64( long long t_a, int t_count );

int main()
{
    printf( "mul64 %Ld\n", mul_i32i32( 123456789, 1000000 ) );
    printf( "mul64 %Lx\n", mul_i32i32( 0x80000000, 0x80000000 ) );

    printf( "add64 %Ld\n", add_i64i64( 123456789000000000, 123456789LL ) );
    printf( "add64 %Ld\n", add_i64i64( 999999999999999, 1 ) );
    printf( "add64 %Lx\n", add_i64i64( 0xFFFFFFFFFFFFFF, 1 ) );

    printf( "div %Ld\n", div_i64i32( 123456789123456789, 10 ) );
    printf( "div %Lx\n", div_i64i32( 0xCAFECACA0BEEF, 16 ) );

    printf( "shr %Lx\n", shr_i64( 0xCAFECACA0BEEF, 4 ) );
}