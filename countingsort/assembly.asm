; x86-64 NASM counting sort
section .data
    arr dd 4, 2, 2, 8, 3, 3, 1
    n   dd 7
    fmt db "%d ", 0
    nl  db 10, 0

section .bss
    count resq 256
    output resq 7

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    ; Find min and max
    mov ecx, [n]
    mov esi, [arr]
    mov edi, esi
    xor rbx, rbx
.find_loop:
    mov eax, [arr + rbx*4]
    cmp eax, esi
    cmovl esi, eax
    cmp eax, edi
    cmovg edi, eax
    inc rbx
    cmp rbx, [n]
    jl .find_loop

    ; Count occurrences
    xor rbx, rbx
.count_loop:
    mov eax, [arr + rbx*4]
    sub eax, esi
    inc qword [count + rax*8]
    inc rbx
    cmp rbx, [n]
    jl .count_loop

    ; Prefix sums
    mov eax, edi
    sub eax, esi
    mov rcx, rax
    mov rbx, 1
.prefix_loop:
    mov rax, [count + rbx*8 - 8]
    add [count + rbx*8], rax
    inc rbx
    cmp rbx, rcx
    jle .prefix_loop

    ; Build output
    mov rcx, [n]
    dec rcx
.output_loop:
    mov eax, [arr + rcx*4]
    mov edx, eax
    sub edx, esi
    dec qword [count + rdx*8]
    mov r8, [count + rdx*8]
    mov [output + r8*8], rax
    dec rcx
    jns .output_loop

    ; Print output
    xor rbx, rbx
.print_loop:
    mov rsi, [output + rbx*8]
    lea rdi, [fmt]
    xor eax, eax
    call printf
    inc rbx
    cmp rbx, [n]
    jl .print_loop

    pop rbp
    xor eax, eax
    ret
