section .data
    arr dd 5, 3, 8, 1, 9, 2, 7, 4, 6, 0
    n   dd 10

section .text
    global _start

_start:
    mov ecx, [n]
    dec ecx
    mov esi, 0
    mov edi, ecx

outer_loop:
    cmp esi, edi
    jge done
    mov ebx, 0
    mov ecx, esi

forward:
    cmp ecx, edi
    jge after_forward
    mov eax, [arr + ecx*4]
    mov edx, [arr + ecx*4 + 4]
    cmp eax, edx
    jle no_swap_fwd
    mov [arr + ecx*4], edx
    mov [arr + ecx*4 + 4], eax
    mov ebx, 1
no_swap_fwd:
    inc ecx
    jmp forward

after_forward:
    cmp ebx, 0
    je done
    mov ebx, 0
    dec edi
    mov ecx, edi

backward:
    cmp ecx, esi
    jl after_backward
    mov eax, [arr + ecx*4]
    mov edx, [arr + ecx*4 + 4]
    cmp eax, edx
    jle no_swap_bwd
    mov [arr + ecx*4], edx
    mov [arr + ecx*4 + 4], eax
    mov ebx, 1
no_swap_bwd:
    dec ecx
    jmp backward

after_backward:
    inc esi
    jmp outer_loop

done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
