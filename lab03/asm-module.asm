
    bits 32
    section .data
	;

    section .text
;TASK 1
	global max_negative
max_negative:
	enter 0,0
	mov edx, [ebp + 8] 	; array
	mov ecx, [ebp + 12] 		; counter
	mov eax, 0x80000000		; initialized with -MAX
.back:

	cmp [edx + ecx * 4 - 4], dword 0
	jge .skip
	cmp [edx + ecx * 4 - 4], eax
	jle .skip
	mov eax, [edx + ecx * 4 - 4]
	.skip

	loop .back

	leave
	ret

	global lowest_byte_num
lowest_byte_num:
	enter 0,0
	push ebx
	mov edx, [ebp + 8] 			; array
	mov ecx, [ebp + 12] 		; arr counter
	mov ebx, 0					; counter
.back:
	mov eax, [edx + ecx * 4 - 4]
	and eax, 0x00000011
	cmp eax, 0
	jne .skip
	inc ebx
	.skip:

	loop .back
	mov eax, ebx
	pop ebx
	leave
	ret

	global remove_digits
remove_digits:
	enter 0,0
	push ebx
	mov edx, [ebp + 8] 			; string
	mov ebx, 0			 		; counter++
	mov ecx, 0					; str counter
.back:
	mov al, [edx + ecx * 1]
	cmp al, 0
	je .done
	cmp al, '0'
	jl .skip
	cmp al, '9'
	jg .skip
	jmp .num
.skip:
	mov al, [edx + ecx * 1]
	mov [edx + ebx * 1], al
	inc ebx;
.num:
	inc ecx;
	jmp .back
.done:
	mov [edx + ebx * 1 ], byte 0
	pop ebx
	leave
	ret


	global int2hexstr
int2hexstr:
	enter 0,0
	push ebx
	push edi
	
	mov edi, [ebp + 16] 			; hexstr ptr
	mov edx, [ebp + 12] 		; table ptr
	mov eax, 8					; hex str counter
	mov ecx, 0 					; shift counter
.back:
	mov ebx, [ebp + 8] 		; int value
	shr ebx, cl
	and ebx, 0x0000000F			; getting 4 bits

	;due to lack of registers
	;push ecx 
	mov bl, [edx + ebx]			; corresponding hex char from table
	mov [edi + eax - 1], bl

	;pop ecx

	sub eax, 1
	add cl ,4
	cmp cl, 32
	jne .back

	pop edi
	pop ebx
	leave
	ret