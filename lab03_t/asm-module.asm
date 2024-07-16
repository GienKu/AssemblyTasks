
    bits 32
    section .data
	;

    section .text
;TASK 1
	global positive_min
positive_min:
	enter 0,0
	mov edx, [ebp + 8] 			; array
	mov ecx, [ebp + 12] 		; counter
	mov eax, 0x7FFFFFFF			; initialized with MAX
.back:

	cmp [edx + ecx * 4 - 4], dword 0
	jle .skip
	cmp [edx + ecx * 4 - 4], eax
	jge .skip
	mov eax, [edx + ecx * 4 - 4]
	.skip

	loop .back

	leave
	ret
;TASK 2
	global lowest4bits
lowest4bits:
	enter 0,0
	push ebx
	mov edx, [ebp + 8] 			; array
	mov ecx, [ebp + 12] 		; arr counter
	mov ebx, 0					; counter
.back:
	mov eax, [edx + ecx * 4 - 4]
	and eax, 0x0000000F
	cmp eax, 0
	jne .skip
	inc ebx
	.skip:

	loop .back
	mov eax, ebx
	pop ebx
	leave
	ret

;TASK 3
	global sum_digits
sum_digits:
	enter 0,0
	push ebx

	mov edx, [ebp + 8] 			; string
	mov ebx, 0			 		; sum
	mov ecx, 0					; str counter
.back:
	movsx eax, byte [edx + ecx * 1]
	cmp eax, 0
	je .done
	cmp eax, '0'
	jl .skip
	cmp eax, '9'
	jg .skip
	sub eax, '0'
	add ebx, eax

.skip:
	inc ecx
	jmp .back
.done:
	mov eax, ebx

	pop ebx
	leave
	ret

; TASK 4
global remove_negatives
remove_negatives:
	enter 0,0
	push ebx

	mov edx, [ebp + 8] 			; arr
	mov ebx, 0			 		; length
	mov ecx, 0			 		; arr counter
.back:
	mov eax, [edx + ecx * 4]
	cmp eax, 0
	jl .negative
	mov [edx + ebx * 4], eax
	inc ebx
.negative:

	inc ecx
	cmp ecx, [ebp + 12]
	jne .back
	mov eax, ebx

	pop ebx
	leave
	ret


; TASK 5
	global hexstr2int
hexstr2int:
	enter 0,0
	push ebx
	push edi
	
	mov edx, [ebp + 8] 				; table ptr
	mov ebx, 0						; new int num
	mov ecx, 0 						; str counter
.back:
	movsx eax, byte [edx + ecx * 1]
	cmp eax, 0
	je .done
	cmp eax, '0'
	jl .letter
	cmp eax, '9'
	jg .letter
	; numerical
	shl ebx, 4
	sub eax, '0'
	add ebx,eax
	jmp .continue
.letter:
	; letter, assuming user will enter valid hex str
	shl ebx, 4
	sub eax, 'A'
	add eax, 10
	add ebx, eax
.continue:
	inc ecx
	jmp .back
.done:
	mov eax, ebx

	pop edi
	pop ebx
	leave
	ret