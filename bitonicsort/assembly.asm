section .data
    arr dd 3, 7, 4, 8, 6, 2, 1, 5
    n   dd 8
    fmt db "%d ", 0
    nl  db 10, 0

section .text
    global main
    extern printf

compare_and_swap:
    push rbp
    mov rbp, rsp
    mov rax, [arr + rdi*4]
    mov rbx, [arr + rsi*4]
    cmp rdx, 1
    je .asc
    cmp rax, rbx
    jl .swap
    jmp .done
.asc:
    cmp rax, rbx
    jg .swap
    jmp .done
.swap:
    mov [arr + rdi*4], ebx
    mov [arr + rsi*4], eax
.done:
    pop rbp
    ret

bitonic_merge:
    push rbp
    mov rbp, rsp
    cmp rsi, 1
    jle .ret
    mov rcx, rsi
    shr rcx, 1
    push rdi
    push rsi
    push rdx
    push rcx
    mov r8, rdi
    mov r9, rcx
.loop:
    cmp r8, rdi
    jge .loop_end
    mov rdi, r8
    mov rsi, r9
    add rsi, r8
    call compare_and_swap
    inc r8
    jmp .loop
.loop_end:
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    call bitonic_merge
    add rdi, rcx
    mov rsi, rcx
    call bitonic_merge
.ret:
    pop rbp
    ret

main:
    push rbp
    mov rbp, rsp
    xor rdi, rdi
    mov rsi, 8
    mov rdx, 1
    call bitonic_sort
    xor rbx, rbx
.print:
    cmp rbx, 8
    jge .done
    lea rdi, [rel fmt]
    mov esi, [arr + rbx*4]
    xor rax, rax
    call printf
    inc rbx
    jmp .print
.done:
    lea rdi, [rel nl]
    xor rax, rax
    call printf
    xor rax, rax
    pop rbp
    ret

bitonic_sort:
    push rbp
    mov rbp, rsp
    cmp rsi, 1
    jle .ret
    mov rcx, rsi
    shr rcx, 1
    push rdi
    push rsi
    push rdx
    push rcx
    mov rsi, rcx
    mov rdx, 1
    call bitonic_sort
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    push rdi
    push rsi
    push rdx
    push rcx
    add rdi, rcx
    mov rsi, rcx
    mov rdx, 0
    call bitonic_sort
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    call bitonic_merge
.ret:
    pop rbp
    ret
