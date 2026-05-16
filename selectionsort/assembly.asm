section .data
    arr dd 5, 3, 1, 4, 2
    n   dd 5

section .text
    global _start

_start:
    mov ecx, [n]
    dec ecx
    xor esi, esi
.outer:
    cmp esi, ecx
    jge .done
    mov edi, esi
    mov eax, esi
    inc eax
.inner:
    cmp eax, [n]
    jge .swap
    mov ebx, [arr + eax*4]
    cmp ebx, [arr + edi*4]
    jge .next
    mov edi, eax
.next:
    inc eax
    jmp .inner
.swap:
    mov eax, [arr + esi*4]
    mov ebx, [arr + edi*4]
    mov [arr + esi*4], ebx
    mov [arr + edi*4], eax
    inc esi
    jmp .outer
.done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
