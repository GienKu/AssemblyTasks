
    bits 64

    section .data

;***************************************************************************

    section .text

    
;RDI, RSI, RDX, RCX, R8 and R9
    global mul_intN_int32
mul_intN_int32:
    push rbx
    push rdi
    ;rdi t_num
    ;rsi num to multiply
    ;rdx t_N

    mov rcx, rdx       ; t_N
    mov rbx, rdi        ; t_num
    mov edi, 0                  ; to save edx

.back:
    mov eax, [ rbx ]        
    mul esi                     ; *= t_mul
    add eax, edi                ; old edx + eax
    adc edx, 0
    mov [ rbx ], eax
    mov edi, edx                ; save edx
    add rbx, 4
    loop .back

    pop rdi
    pop rbx
    ret


;RDI, RSI, RDX, RCX, R8 and R9

    global add_intN_int32
add_intN_int32:
    ;rdi t_num
    ;rsi t_add
    ;rdx t_n

    mov rcx, rdx   ; t_N
    dec rcx
    mov rdx, rdi   ; t_num
    mov eax, esi   ; t_add
    add [ rdx ], eax        ; t_num[ 0 ] += t_add
    mov rax, 1
.back:
    jnc .done
    adc dword [ rdx + rax * 4 ], 0  ; t_num[ eax ] += 0 + CF
    inc rax
    loop .back
.done:
    ret


;RDI, RSI, RDX, RCX, R8 and R9

    global div_intN_int32
div_intN_int32:
    push rbx
    ;rdi t_num
    ;rsi t_div
    ;rdx t_n
    mov rcx, rdx   ; t_N
    mov rbx, rdi    ; t_num
    mov edx, 0
.back:
    mov eax, [ rbx + rcx * 4 - 4 ]
    div esi  ; /= t_div
    mov [ rbx + rcx * 4 - 4 ], eax
    loop .back

    mov eax, edx            ; reminder

    pop rbx
    ret