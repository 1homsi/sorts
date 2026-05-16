section .data
    arr dd 5, 2, 8, 1, 9, 3, 7, 4, 6
    n   dd 9
    MIN_RUN equ 32
    fmt db "%d ", 0
    newline db 10, 0

section .bss
    lp resd 256
    rp resd 256

section .text
    global main
    extern printf

insertion_sort:
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    push r15
    mov rbx, rdi
    mov r12d, esi
    mov r13d, edx
    lea r14d, [r12d + 1]
.outer:
    cmp r14d, r13d
    jg .done
    mov eax, r14d
    imul eax, 4
    mov ecx, [rbx + rax]
    mov r15d, r14d
    dec r15d
.inner:
    cmp r15d, r12d
    jl .insert
    mov eax, r15d
    imul eax, 4
    mov edx, [rbx + rax]
    cmp edx, ecx
    jle .insert
    lea eax, [r15d + 1]
    imul eax, 4
    mov [rbx + rax], edx
    dec r15d
    jmp .inner
.insert:
    lea eax, [r15d + 1]
    imul eax, 4
    mov [rbx + rax], ecx
    inc r14d
    jmp .outer
.done:
    pop r15
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
    mov edx, 8
    call insertion_sort
    mov ecx, 0
.print:
    cmp ecx, 9
    jge .end
    lea rdi, [fmt]
    mov eax, ecx
    imul eax, 4
    mov esi, [arr + rax]
    xor eax, eax
    call printf
    inc ecx
    jmp .print
.end:
    lea rdi, [newline]
    xor eax, eax
    call printf
    xor eax, eax
    pop rbp
    ret
