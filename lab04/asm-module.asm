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

    global shr_i64
shr_i64:
    enter 0,0

    mov eax, [ ebp + 8 ]        ; a-l
    mov edx, [ ebp + 12 ]       ; a-h
    mov ecx, [ ebp + 16 ]       ; count

    shrd eax, edx, cl
    shr edx, cl

    leave
    ret

    global div_i64i32
	div_i64i32:
    enter 0,0

    mov edx, 0
    mov eax, [ ebp + 12 ]       ; a-h
    div dword [ ebp + 16 ]      ; /= b

    ; eax - result
    ; edx - reminder
    mov ecx, eax                ; save 1st result

    mov eax, [ ebp + 8 ]        ; a-l
    div dword [ ebp + 16 ]      ; /= b

    ; eax is result
    mov edx, ecx                ; higher part of result

    leave
    ret

    global add_i64i64
add_i64i64:
    enter 0,0

    mov eax, [ ebp + 16 ]           ; b-l
    add eax, [ ebp + 8 ]            ; *= a-l

    mov edx, [ ebp + 20 ]           ; b-h
    adc edx, [ ebp + 12 ]           ; += a-h

    leave
    ret

    global mul_i32i32
mul_i32i32:
    enter 0,0

    mov eax, [ ebp +  8 ]       ; t_a
    imul dword [ ebp + 12 ]     ; *=t_b

    leave
    ret
