section .data
    arr dd 64, 34, 25, 12, 22, 11, 90
    n   dd 7

section .text
    global _start

_start:
    mov ecx, [n]
    shr ecx, 1          ; gap = n/2

.gap_loop:
    test ecx, ecx
    jz .done

    push ecx            ; save gap
    mov ebx, ecx        ; i = gap
.i_loop:
    mov eax, [n]
    cmp ebx, eax
    jge .i_done

    mov eax, ebx
    shl eax, 2
    mov edx, [arr + eax]  ; temp = arr[i]
    push edx               ; save temp
    mov esi, ebx           ; j = i

.j_loop:
    mov eax, [esp + 4]  ; gap
    cmp esi, eax
    jl .j_done
    mov eax, esi
    sub eax, [esp + 4]
    shl eax, 2
    mov edi, [arr + eax]   ; arr[j-gap]
    mov eax, [esp]         ; temp
    cmp edi, eax
    jle .j_done
    mov eax, esi
    shl eax, 2
    mov [arr + eax], edi
    mov eax, [esp + 4]
    sub esi, eax
    jmp .j_loop

.j_done:
    pop edx
    mov eax, esi
    shl eax, 2
    mov [arr + eax], edx
    inc ebx
    jmp .i_loop

.i_done:
    pop ecx
    shr ecx, 1
    jmp .gap_loop

.done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
