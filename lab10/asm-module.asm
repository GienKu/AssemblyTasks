
    bits 64

    section .data

;***************************************************************************

    section .text

    
;RDI, RSI, RDX, RCX, R8 and R9
    global check_triangle
check_triangle:
    xorpd xmm3, xmm3
    xorpd xmm4, xmm4
    xorpd xmm5, xmm5

    addsd xmm3, xmm0
    addsd xmm3, xmm1        ;a+b

    addsd xmm4, xmm0
    addsd xmm4, xmm2        ;a+c
    
    addsd xmm5, xmm1
    addsd xmm5, xmm2        ;b+c

    comisd xmm3, xmm2;
    jb .false

    comisd xmm4, xmm1;
    jb .false

    comisd xmm5, xmm0;
    jb .false

    mov eax, 1
    jmp .exit
.false:
    mov eax, 0
.exit:
    ret

    global quadratic
quadratic:
    movsd xmm4, xmm1    ; b
    mulsd xmm4, xmm1    ; b^2

    mov eax, 4
    cvtsi2sd xmm5, eax  ; 4
    mulsd xmm5, xmm0    ; 4 * a
    mulsd xmm5, xmm2    ; 4 * a * c

    subsd xmm4, xmm5    ; delta

    xorpd xmm6, xmm6    ; 0
    comisd xmm4, xmm6   ; delta < 0
    jb .exitt
    je .equals
    ;x1
    subsd xmm6, xmm1    ; -b
    sqrtsd xmm4, xmm4         ; sqrt(delta)
    addsd xmm0, xmm0    ; 2a
    addsd xmm6, xmm4    ; -b + sqrt(d)
    divsd xmm6, xmm0    ; -b + sqrt(d) / 2a
    movsd [rdi], xmm6
    ;x2
    xorpd xmm6, xmm6    ; 0
    subsd xmm6, xmm1    ; -b
    subsd xmm6, xmm4    ; -b - sqrt(d)
    divsd xmm6, xmm0    ; -b - sqrt(d) / 2a
    movsd [rdi + 8], xmm6

    jmp .exitt
.equals:
    subsd xmm6, xmm1    ; -b
    addsd xmm0, xmm0    ; 2a
    divsd xmm6, xmm0    ; -b/2a
    movsd [rdi], xmm6       ; save same value
    movsd [rdi + 8], xmm6   
.exitt:
    movsd xmm0, xmm4
    ret

    global len_vector
len_vector:
    movsx rcx, esi  ; N
    xorps xmm0, xmm0  ; 0
.back:
    movss xmm1, [rdi + rcx * 4 - 4]
    mulss xmm1, xmm1
    addss xmm0, xmm1
    loop .back
    sqrtss xmm0, xmm0
    ret
