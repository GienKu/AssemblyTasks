
    bits 32

    section .data

    section .text


; TASK 2
    global toUpperLower
toUpperLower:
    enter 0,0
    push edi
    push esi

    mov esi, [ebp + 8]  ; string* ptr - source
    mov edi, [ebp + 8]  ; string* ptr - dest
    mov edx, [ebp + 12] ; upper or lower

    mov ax, ds
    mov es, ax

.back:
    lodsb
    cmp al, 0   ; \0 null terminator
    je .done

    cmp edx, 1  ; upper or lower
    je .toUpper
;toLower
    cmp al, 'A'
    jl .skip
    cmp al, 'Z'
    jg .skip
    add al, 32;
    stosb
    jmp .back

.toUpper:
    cmp al, 'a'
    jl .skip
    cmp al, 'z'
    jg .skip
    sub al, 32;
.skip:
    stosb
    jmp .back
.done:

    pop esi
    pop edi
    leave
    ret

; TASK 3

mystrlen:
    enter 0,0
    push edi
    push esi
    push ecx

    mov edi, [ ebp + 8 ]        ; *str
    mov ecx, -1                 ; mov ecx, 0, not ecx
    mov ax, ds
    mov es, ax
    mov al, 0

    repnz scasb

    mov eax, edi
    sub eax, [ ebp + 8 ]
    dec eax                     ; string length

    pop ecx
    pop esi
    pop edi
    leave
    ret


    global my_strcmp
my_strcmp:
    enter 0,0

    push edi
    push esi
    push ebx

    mov esi, [ebp + 8]      ; s1
    mov edi, [ebp + 12]     ; s2

    mov ax, ds
    mov es, ax
    
    push esi
    call mystrlen
    pop ebx
    mov ecx, eax            ; len of s1

    push edi
    call mystrlen
    pop ebx
    mov ebx, eax            ; len of s2

    cmp ecx, ebx            ; s1 < s2
    cmovg ecx, ebx      
        
    inc ecx
    repe cmpsb              ; loop until not equal

    ; mov dl, [esi]
    ; cmp dl, [edi]
    jl .less
    jg .greater
    mov eax, 0 
    jmp .done
.less:          ; s1 < s2
    mov eax, -1
    jmp .done
.greater:       ; s1 > s2
    mov eax, 1
.done:
    ; mov eax, 0
    ; mov al, [esi]
    pop ebx
    pop esi
    pop edi
    leave
    ret


; TASK 4

    global c_zeros
c_zeros:
    enter 0,0
    push esi
    push edi

    mov ax, ds
    mov es, ax

    mov edi, [ebp + 8]  ; arr
    mov ecx, [ebp + 12] ; arr counter
    mov eax, 0          ; acc
    mov edx, 0          ; zeros counter

.back:
    repnz scasd
    jne .check
    inc edx
.check:
    cmp ecx, 0
    jne .back

    mov eax, edx
    pop edi
    pop esi
    leave
    ret

; TASK 5
  global i_sum
i_sum:
    enter 0,0
    push esi
    push edi

    mov ax, ds
    mov es, ax

    mov esi, ebp 
    add esi, 8
    mov edx, 0
.back:
    lodsd
    cmp eax, -1     ;check if the last is -1
    je .done
    add edx, eax    ;add to sum
    jmp .back
.done:

    mov eax, edx
    pop edi
    pop esi
    leave
    ret
