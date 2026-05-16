section .data
    arr dd 3, 1, 4, 1, 5, 9, 2, 6
    n   dd 8
    fmt db "%d ", 0
    nl  db 10, 0

section .text
    global main
    extern printf

stooge_sort:
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    mov r12, rdi
    mov r13d, esi
    mov r14d, edx
    lea rax, [r12 + r13*4]
    lea rbx, [r12 + r14*4]
    mov eax, [rax]
    mov ecx, [rbx]
    cmp eax, ecx
    jle .no_swap
    lea rax, [r12 + r13*4]
    lea rbx, [r12 + r14*4]
    mov eax, [rax]
    mov ecx, [rbx]
    lea rdx, [r12 + r13*4]
    lea r8, [r12 + r14*4]
    mov [rdx], ecx
    mov [r8], eax
.no_swap:
    mov eax, r14d
    sub eax, r13d
    add eax, 1
    cmp eax, 2
    jle .done
    imul eax, 2
    mov ecx, 3
    cdq
    idiv ecx
    mov r8d, eax
    lea rdi, [r12]
    mov esi, r13d
    mov edx, r13d
    add edx, r8d
    sub edx, 1
    call stooge_sort
    lea rdi, [r12]
    mov esi, r14d
    sub esi, r8d
    add esi, 1
    mov edx, r14d
    call stooge_sort
    lea rdi, [r12]
    mov esi, r13d
    mov edx, r13d
    add edx, r8d
    sub edx, 1
    call stooge_sort
.done:
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret

main:
    push rbp
    mov rbp, rsp
    lea rdi, [arr]
    mov esi, 0
    mov edx, 7
    call stooge_sort
    mov ecx, 0
.loop:
    cmp ecx, 8
    jge .end
    lea rdi, [fmt]
    mov esi, [arr + ecx*4]
    xor eax, eax
    push rcx
    call printf
    pop rcx
    inc ecx
    jmp .loop
.end:
    lea rdi, [nl]
    xor eax, eax
    call printf
    xor eax, eax
    pop rbp
    ret
