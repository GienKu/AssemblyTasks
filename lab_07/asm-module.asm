
    bits 64

    section .data
    prnt db "%d, ", 0
    section .text
    extern printf
; TASK 1
    global sum
sum:
    ; RDI, RSI, RDX, RCX, R8, R9 
    mov ecx, esi     ; n
    mov rax, 0
.back:
    movsx rdx, dword [rdi + rcx * 4 - 4]
    add rax, rdx
    loop .back
    ret
 
 ; TASK 2
    global factorial
factorial:
    ; RDI, RSI, RDX, RCX, R8, R9 
    mov rax, 1
    mov ecx, edi    ; N
.back:
    mul ecx
    jo .overflow
    loop .back
    jmp .done
.overflow:
    mov rax, 0
.done:
    ret

; TASK 3

    global minmax
minmax:
    ; RDI, RSI, RDX, RCX, R8, R9 
    mov r9, rdx     ; *min just for me
    mov r8, rcx     ; *max

    mov rdx, [rdi]  ; 1 elem.
    mov [r8], rdx
    mov [r9], rdx

    mov ecx, esi    ; N
 
.back:
    mov rdx, [rdi + rcx * 8 - 8]

    cmp rdx, [r8]
    jg .skip_min
    mov [r8], rdx         ; min
.skip_min:
    cmp rdx, [r9]
    jl .skip_max
    mov [r9], rdx         ; max
.skip_max:
    loop .back
    ret

; TASK 4
    global c_even_digits
c_even_digits:
    ; RDI, RSI, RDX, RCX, R8, R9 

	mov rbx, 0			 		; counter++
	mov rcx, 0					; str counter
.back:
	mov al, [rdi + rcx * 1]
	cmp al, 0
	je .done
	cmp al, '0'
	jl .skip
	cmp al, '9'
	jg .skip

	sub al, '0'     ; extract num
    shr al, 1       
    jc .skip        ; check if even
    inc rbx
.skip:
	inc rcx;
	jmp .back
.done:
    mov rax, rbx
    ret

; TASK 5
    global factorization
factorization:
    ; RDI, RSI, RDX, RCX, R8, R9 
    mov rbx, 2      ; divisor
    mov rax , rdi   ; dividend
    mov rcx, 0      ; length
.back:
    cqo
    idiv rbx
    cmp rdx, 0                  ; checking remainder
    jne .skip
    mov rdi, rax                ; update rdi
    mov [rsi + rcx * 1], bl    ; save to arr
    inc rcx                     ; length++
    jmp .continue
.skip:
    mov rax, rdi              ; restore value to state before division
    inc rbx
.continue:   
    cmp rax, 1
    jne .back
    mov rax, rcx
    ret