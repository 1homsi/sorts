section .data
    arr dd 3, 6, 2, 7, 4, 1, 5
    n   dd 7

section .text
    global _start

flip:
    push rbp
    mov rbp, rsp
    mov rsi, rdi
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    jge .done
    mov eax, [arr + rcx*4]
    mov ebx, [arr + rdx*4]
    mov [arr + rcx*4], ebx
    mov [arr + rdx*4], eax
    inc rcx
    dec rdx
    jmp .loop
.done:
    pop rbp
    ret

_start:
    mov r12, 7
.outer:
    cmp r12, 1
    jle .exit
    xor r13, r13
    xor rcx, rcx
.find_max:
    cmp rcx, r12
    jge .do_flip
    mov eax, [arr + rcx*4]
    mov ebx, [arr + r13*4]
    cmp eax, ebx
    jle .no_update
    mov r13, rcx
.no_update:
    inc rcx
    jmp .find_max
.do_flip:
    mov rax, r12
    dec rax
    cmp r13, rax
    je .next
    test r13, r13
    jz .skip_first
    mov rdi, 0
    mov rdx, r13
    call flip
.skip_first:
    mov rdi, 0
    mov rdx, r12
    dec rdx
    call flip
.next:
    dec r12
    jmp .outer
.exit:
    mov rax, 60
    xor rdi, rdi
    syscall
