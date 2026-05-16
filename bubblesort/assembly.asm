section .data
    arr dd 64, 34, 25, 12, 22, 11, 90
    n   dd 7

section .text
    global _start

_start:
    mov ecx, [n]
outer:
    xor esi, esi
    mov edx, 0
    mov ebx, ecx
    dec ebx
inner:
    cmp edx, ebx
    jge next_pass
    lea edi, [arr + edx*4]
    mov eax, [edi]
    mov ebx, [edi + 4]
    cmp eax, ebx
    jle no_swap
    mov [edi], ebx
    mov [edi + 4], eax
    mov esi, 1
no_swap:
    inc edx
    mov ebx, ecx
    dec ebx
    jmp inner
next_pass:
    dec ecx
    test esi, esi
    jnz outer
    mov eax, 1
    xor ebx, ebx
    int 0x80
