
    bits 32

    section .data
    mystr db "%d", 10, 0   
    section .text
    extern printf
    extern prnt
; TASK 1
    global my_strlen
my_strlen:
    enter 0,0
    push esi

    mov esi, [ebp + 8]

    cmp byte [esi], 0   ; null terminator
    je .null

    add esi, 1 

    push esi
    call my_strlen
    pop ecx
    add eax, 1
    jmp .return
.null:
    mov eax, 0
.return:
    pop esi
    leave
    ret

; TASK 2
    global print_seq
print_seq:
    enter 0,0
    mov eax, [ebp + 8]  ; start

.back:
    push eax            ; for me
    push eax
    push mystr
    call printf
    add esp, 8
    pop eax             ; restore value

    add eax, [ebp + 16] ; add step
    cmp eax, [ebp + 12] ; cmp to stop
    jle .back

    leave
    ret
; TASK 3

    global bubble_sort
bubble_sort:
    enter 0,0
    push esi
    push ebx

    mov esi, [ebp + 8]  ; int arr
    mov ecx, 0          ; N
.loop_1:
    mov edx, 1
    
.loop_2:
    mov eax, [esi + edx * 4]        ; eax = arr[i]
    cmp [esi + edx * 4 - 4], eax    ; arr[i-1] < arr[i]
    jl .skip
    xchg eax, [esi + edx * 4 - 4]   ;
    mov [esi + edx * 4], eax
.skip:
    inc edx
    mov ebx, [ebp + 12]
    sub ebx , ecx       ; a little more efficient way
    cmp edx, ebx        ; cmp to N - ecx
    jl .loop_2

    inc ecx
    cmp ecx, [ebp + 12] ;cmp to N
    jl .loop_1

    pop ebx
    pop esi
    leave
    ret

; TASK 4
find_max:
    enter 0,0
    mov edx, [ebp + 8]  ; arr
    mov ecx, [ebp + 12] ; N
    mov eax, [edx]      ; max = arr[0]
.back:
    cmp [edx + ecx * 4 - 4], eax ; arr[i] < max
    jl .skip
    mov eax, [edx + ecx * 4 - 4]
.skip:
    loop .back
    leave
    ret

    global count_max
count_max:
    enter 0,0
    push ebx

    push dword [ebp + 12]
    push dword [ebp + 8]
    call find_max
    pop edx
    pop ecx
    
    mov ebx, eax        ; ebx = max
    mov eax, 0          ; eax = max counter
.back:
    cmp [edx + ecx * 4 - 4], ebx
    jne .skip
    inc eax
.skip:
    loop .back

    pop ebx
    leave
    ret

; TASK 5
global most_common_remainder
most_common_remainder:
    enter 0,0
    mov eax, [ebp + 16]      ; Mod
    shl eax, 2               ; Mod *= 4
    sub esp, eax             ; enter Mod*4,0

    push edi
    push esi
    push ebx
    mov ebx, eax            ; ebx now store N-bytes we occupy
                            ; under ebp
    ; fill with zeros
    mov edi, ebp           
    sub edi, ebx            ; beggining of modulo arr
    mov eax, 0              ; 0 to fill
    mov ecx, ebx            ; counter for rep
    rep stosb               ; fill

    ; loop through arr
    mov esi, [ebp + 8]      ; arr
    mov ecx, 0              ; i
.back:
    mov eax, [esi + ecx * 4]
    cdq
    idiv dword [ebp + 16]     ; arr[i] mod modulo

    mov edi, ebp           
    sub edi, ebx            ; beggining of modulo arr
    ; shl edx, 2              ; remainder * 4
    inc dword [edi + edx * 4]   ; beggining + remainder * 4

    inc ecx
    cmp ecx, [ebp + 12] ; i < N
    jl .back

    ; find max in our moudlo arr
    mov edi, ebp           
    sub edi, ebx            ; beggining of modulo arr
    mov ecx, 0              ; i            
    mov edx, [edi]          ; our most common remainder counter
.back_2:

    cmp [edi + ecx * 4], edx
    jl .skip
    mov edx, [edi + ecx * 4]
    mov eax, ecx
.skip:
    inc ecx
    cmp ecx, [ebp + 16] ; i < Mod
    jl .back_2

    ; print our array
    push eax                ; for me to hold most common remainder from prevoius loop
    push dword [ebp + 16]   ; modulo arr length
    push edi                ; arr
    call prnt
    add esp, 8
    pop eax


    pop ebx
    pop esi
    pop edi
    leave
    ret