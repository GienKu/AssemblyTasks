;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Empty project
;
;***************************************************************************

    bits 32

    section .data

;***************************************************************************

    section .text

    global mul_intN_int32
mul_intN_int32:
    enter 0,0
    push ebx
    push edi

    mov ecx, [ ebp + 16 ]       ; t_N
    mov ebx, [ ebp + 8 ]        ; t_num
    mov edi, 0                  ; to save edx

.back:
    mov eax, [ ebx ]        
    mul dword [ ebp + 12 ]      ; *= t_mul
    add eax, edi                ; old edx + eax
    adc edx, 0
    mov [ ebx ], eax
    mov edi, edx                ; save edx
    add ebx, 4
    loop .back

    pop edi
    pop ebx
    leave
    ret

    global add_intN_int32
add_intN_int32:
    enter 0,0

    mov ecx, [ ebp + 16 ]   ; t_N
    dec ecx
    mov edx, [ ebp + 8 ]    ; t_num
    mov eax, [ ebp + 12 ]   ; t_add
    add [ edx ], eax        ; t_num[ 0 ] += t_add
    mov eax, 1
.back:
    jnc .done
    adc dword [ edx + eax * 4 ], 0  ; t_num[ eax ] += 0 + CF
    inc eax
    loop .back
.done:
    leave
    ret

    global div_intN_int32
div_intN_int32:
    enter 0,0
    push ebx

    mov ecx, [ ebp + 16 ]   ; t_N
    mov ebx, [ ebp + 8 ]    ; t_num
    mov edx, 0
.back:
    mov eax, [ ebx + ecx * 4 - 4 ]
    div dword [ ebp + 12 ]  ; /= t_div
    mov [ ebx + ecx * 4 - 4 ], eax
    loop .back

    mov eax, edx            ; reminder

    pop ebx
    leave
    ret



