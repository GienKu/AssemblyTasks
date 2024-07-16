
    bits 32
    section .data
    ;TASK 1
	extern carray
	extern iarray
	;TASK 2
	extern xnum;
	extern byte0
	extern byte1
	extern byte2
	extern byte3
	;TASK 3
	extern animal
	;TASK 4
	extern texts
	extern pass
	
    section .text
    ;TASK 1
	global changeArray
changeArray:
	mov ecx, dword 4;
	loop:
	movsx edx, byte [carray + ecx - 1]
	mov dword [iarray + ecx * 4 - 4], edx
	dec ecx
	jnz loop
	ret
;TASK 2
	global extractBytes
extractBytes:
	mov	al, byte[xnum + 0]
	mov byte[byte0], al
	
	mov	al, byte[xnum + 1]
	mov byte[byte1], al
	
	mov	al, byte[xnum + 2]
	mov byte[byte2], al
	
	mov	al, byte[xnum + 3]
	mov byte[byte3], al
	ret
;TASK 3
	global reverse
reverse:
	mov al, byte[animal + 0]
	xchg al, byte[animal + 4]
	mov byte[animal + 0], al
	
	mov al, byte[animal + 1]
	xchg al, byte[animal + 3]
	mov byte[animal + 1], al
	ret
	
	global password
password:
	mov eax, dword[pass]
	mov dword[texts], eax
	
	mov eax, dword[pass+4]
	mov dword[texts + 4], eax
	
	mov eax, dword[pass+8]
	mov dword[texts + 8], eax
	ret