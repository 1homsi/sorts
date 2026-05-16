section .data
    arr dd 170, 45, 75, 90, 802, 24, 2, 66
    n   equ 8

section .bss
    output resd 8
    count  resd 10

section .text
    global _start

_start:
    mov ecx, n
    xor esi, esi
    mov eax, [arr]
find_max:
    cmp esi, n
    jge max_done
    mov ebx, [arr + esi*4]
    cmp ebx, eax
    jle .skip
    mov eax, ebx
.skip:
    inc esi
    jmp find_max
max_done:
    mov edi, eax
    mov esi, 1

exp_loop:
    mov eax, edi
    xor edx, edx
    div esi
    test eax, eax
    jz done

    xor ecx, ecx
clear_count:
    cmp ecx, 10
    jge count_done
    mov dword [count + ecx*4], 0
    inc ecx
    jmp clear_count
count_done:

    xor ecx, ecx
count_loop:
    cmp ecx, n
    jge count_loop_done
    mov eax, [arr + ecx*4]
    xor edx, edx
    div esi
    xor edx, edx
    mov ebx, 10
    div ebx
    mov ebx, edx
    inc dword [count + ebx*4]
    inc ecx
    jmp count_loop
count_loop_done:

    mov ecx, 1
accum_loop:
    cmp ecx, 10
    jge accum_done
    mov eax, [count + ecx*4]
    mov ebx, [count + ecx*4 - 4]
    add eax, ebx
    mov [count + ecx*4], eax
    inc ecx
    jmp accum_loop
accum_done:

    mov ecx, n-1
build_output:
    cmp ecx, 0
    jl build_done
    mov eax, [arr + ecx*4]
    push eax
    xor edx, edx
    div esi
    xor edx, edx
    mov ebx, 10
    div ebx
    mov ebx, edx
    dec dword [count + ebx*4]
    mov edx, [count + ebx*4]
    pop eax
    mov [output + edx*4], eax
    dec ecx
    jmp build_output
build_done:

    mov ecx, 0
copy_back:
    cmp ecx, n
    jge copy_done
    mov eax, [output + ecx*4]
    mov [arr + ecx*4], eax
    inc ecx
    jmp copy_back
copy_done:

    imul esi, 10
    jmp exp_loop

done:
    mov eax, 1
    xor ebx, ebx
    int 0x80
