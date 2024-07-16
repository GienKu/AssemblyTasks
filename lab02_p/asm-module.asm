
    bits 32
    section .data
	;VARIABLES
	extern g_iarray, g_min, xnum, g_bits, g_str, g_digits, g_carray, int_sum

    section .text
;TASK 1 
	global search_positive
search_positive:
	mov ecx, 11;
	mov eax, 0x7FFFFFFF; max int value
.back:
	cmp [g_iarray + ecx * 4 - 4], dword 0 ; arr[i] < 0
	jle .continue
	cmp [g_iarray + ecx * 4 - 4], eax ; arr[i] < min
	jge .continue
	mov eax, [g_iarray + ecx * 4 - 4]
.continue:
	loop .back

	mov [g_min], eax
	ret
;TASK 2
	global count_bits
count_bits:
	mov cl, 0				;counter
	mov dword [g_bits], 0	;init sum
.start:
	mov eax, [xnum]			;10101010
	;instead xor we could use cmp eax, 0 with jump
	xor eax, 0xFFFFFFFF		;01010101 /invert 0 to 1
	shr eax, cl				;01010101 -> 0

	and eax, 0x00000001		;0000000x
	add [g_bits], eax		;add x (0 or 1)

	inc cl
	cmp cl, 32
	jne .start

	ret
;TASK 3
	global count_digits
count_digits:
	mov ecx, 0
	mov dword[g_digits], 0

.start:
	cmp byte [g_str + ecx], 0
	je .done
	cmp	byte [g_str + ecx], '0'		; g_str[i] < '0'
	jl .continue
	cmp	byte[g_str + ecx], '9'		; g_str[i] > '9'
	jg .continue
	add dword[g_digits], 1

.continue:
	inc ecx
	jmp .start
.done:
	ret

;TASK 4
	global char_sum
char_sum:
	mov ecx, 5
	mov dword [int_sum], 0
.back:
	movsx eax, byte[g_carray + ecx - 1] ;signed extension
	add [int_sum], eax
	loop .back
	ret
