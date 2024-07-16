
    bits 32

    section .data



    section .text

;TASK 1
    global sum_ll
sum_ll:
    enter 0,0
    push ebx

    mov eax, 0          ; lower bits
    mov edx, 0          ; higer bits

    mov ecx, 0          ; counter
    mov ebx, [ebp + 8]  ; arr
.back:

    add eax, dword [ebx + ecx * 8]      ; adding lower bits
    adc edx, dword [ebx + ecx * 8 + 4]  ; adding  higher bits with carry from previous addition

    inc ecx
    cmp ecx , [ebp + 12]
    jne .back

    pop ebx
    leave
    ret

; TASK 2
    global sum_ints
sum_ints:
    enter 0,0
    push ebx
    push esi
    push edi

    mov ecx, 0          ; counter
    mov ebx, [ebp + 8]  ; arr

    mov eax, 0;
    mov edx, 0;

.back:
    add eax, dword [ebx + ecx * 4] 
    cdq
    add esi, eax
    adc edi, edx
    
    adc edx, 0
    
    inc ecx
    cmp ecx , [ebp + 12]
    jne .back
    mov eax, esi
    mov edx, edi

    pop edi
    pop esi
    pop ebx
    leave
    ret


; TASK 3
;     global long2str
; .long2str:
;     enter 8,0

;     mov eax, [ebp + 12]     ; higher bits
;     mov edx, [ebp + 8]      ; lower bits
;     mov [ebp - 4], dword 10 ; base
;     cmp edx, 0
;     jg .positive
; ;negative
;     mov [ ecx ], byte '-' 
;     neg edx
;     neg eax
;     inc ecx
; .positive

; .back
; .positive
;     cmp edx, 0

    


;     leave
;     ret

;TASK 4
   global max_long_arr
max_long_arr:
    enter 0,0
    push ebx
    push edi

    mov edi, [ebp + 8]  ; pointer to current highest value

    mov ecx, 0          ; counter
    mov ebx, [ebp + 8]  ; arr
.back:

    mov eax, [ebx + ecx * 8 + 4]    ; load higher part to compare
    cmp eax, [edi + 4]              ; cmp higher part with max higher part
    jl .skip                        ; if less then skip
    jg .greater
    mov eax, [ebx + ecx * 8 ]       ; load lower part
    cmp eax, [edi ]                 ; cmp lower part with max lower part
    jle .skip                       ; if less then skip

.greater:
    lea edi, [ebx + ecx * 8]        ; load new max pointer
.skip:
    

    inc ecx
    cmp ecx , [ebp + 12]
    jne .back
    mov eax, [edi]
    mov edx, [edi + 4]

    pop edi
    pop ebx
    leave
    ret

; TASK 5
    global hex2longlong
hex2longlong:
    enter 0,0
	push ebx
	push edi
	
	mov ebx, [ebp + 8] 				; str ptr
	mov edx, 0						; higher part
    mov eax, 0                      ; lower part
	mov ecx, 0 						; str counter
.back:
	movsx edi, byte [ebx + ecx * 1] ; load char
	cmp edi, 0
	je .done
	cmp edi, '0'
	jl .letter
	cmp edi, '9'
	jg .letter
	; numerical
	shld edx, eax, 4
    shl eax, 4
	sub edi, '0'
	add eax, edi
	jmp .continue
.letter:
	; letter, assuming user will enter valid hex str
	shld edx, eax, 4
    shl eax, 4
	sub edi, 'A'
	add edi, 10
	add eax, edi
.continue:
	inc ecx
	jmp .back
.done:


	pop edi
	pop ebx
	leave
	ret
    