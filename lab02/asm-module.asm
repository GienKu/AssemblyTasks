
    bits 32
    section .data
	;VARIABLES
	extern xbits, M, iarray, max, g_str, num, carray, xnum, bytee

    section .text
;TASK 1
	global highest_bit
highest_bit:
	mov eax, [xbits]
	mov ecx, 0
	mov cl, 1 ;counter
.start:
	mov eax, [xbits]
	shl eax, cl
	jc .done
	inc cl
	cmp cl, 32
	jne .start
.done:
	mov [M], ecx
	ret
; TASK 2
	global max_even
max_even:
	push ebx

	mov ecx, 10
	mov dword[max], 0x80000000
	mov ebx, 2
.start:
	mov eax, [iarray + ecx * 4 - 4]
	and eax, 1
	cmp eax, 0						;reminder == 0
	jne .skip
	mov eax, [iarray + ecx * 4 - 4]
	cmp eax, [max]					;arr[i] > max
	jle .skip
	mov [max], eax
.skip:
	loop .start
	pop ebx
	ret
;TASK 3
	global count_digits
count_digits:
	mov ecx, 0
	mov dword[num], 0				;init counter

.start:
	cmp byte [g_str + ecx], 0
	je .done
	cmp	byte [g_str + ecx], '0'		; g_str[i] < '0'
	jl .continue
	cmp	byte[g_str + ecx], '9'		; g_str[i] > '9'
	jg .continue
	mov al, byte[g_str + ecx]
	and al, 1					;str[i] & 1
	cmp al, 0 					;digit == 0
	je .even
;not even
	sub dword[num], 1
	jmp .continue
.even:
	add dword[num], 1

.continue:
	inc ecx
	jmp .start
.done:
	ret

;TASK 4
	global change_negatives
change_negatives:
	mov ecx, 8
.back:
	mov al, byte[carray + ecx - 1]
	cmp al, 0		; byte < 0
	jge .skip
	neg al
	mov byte[carray + ecx - 1], al
.skip:
	loop .back
	ret


;TASK 5
	global max_byte
max_byte:
	mov cl, 0
	mov byte[bytee], 0x80
.start:
	mov eax, [xnum]
	shr eax, cl
	cmp byte[bytee], al	 ; max < al
	jge .skip
	mov byte [bytee], al
.skip:
	add cl, 8;
	cmp cl, 32
	jne .start
	ret