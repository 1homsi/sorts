section .data
    arr dd 5, 3, 8, 1, 9, 2, 7, 4, 6, 0
    n   dd 10

section .text
    global _start

_start:
    mov ecx, 0
.loop:
    mov eax, [n]
    cmp ecx, eax
    jge .done
    cmp ecx, 0
    je .advance
    mov eax, [arr + ecx*4]
    mov ebx, [arr + ecx*4 - 4]
    cmp eax, ebx
    jge .advance
    mov [arr + ecx*4], ebx
    mov [arr + ecx*4 - 4], eax
    dec ecx
    jmp .loop
.advance:
    inc ecx
    jmp .loop
.done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
