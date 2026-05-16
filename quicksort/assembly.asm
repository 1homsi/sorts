section .data
    arr dd 3, 6, 8, 10, 1, 2, 1
    n   dd 7

section .text
    global _start

partition:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    mov rcx, rsi
    mov rdx, rdx
    mov r8d, [rax + rdx*4]
    mov r9, rcx
    dec r9
    mov r10, rcx
.loop:
    cmp r10, rdx
    jge .done
    mov r11d, [rax + r10*4]
    cmp r11d, r8d
    jg .next
    inc r9
    mov r12d, [rax + r9*4]
    mov [rax + r9*4], r11d
    mov [rax + r10*4], r12d
.next:
    inc r10
    jmp .loop
.done:
    inc r9
    mov r11d, [rax + r9*4]
    mov r12d, [rax + rdx*4]
    mov [rax + r9*4], r12d
    mov [rax + rdx*4], r11d
    mov rax, r9
    pop rbp
    ret

quicksort:
    push rbp
    mov rbp, rsp
    cmp rsi, rdx
    jge .ret
    push rsi
    push rdx
    call partition
    mov r13, rax
    pop rdx
    pop rsi
    push r13
    mov rdx, r13
    dec rdx
    call quicksort
    pop r13
    mov rsi, r13
    inc rsi
    call quicksort
.ret:
    pop rbp
    ret

_start:
    lea rdi, [arr]
    xor rsi, rsi
    mov rdx, 6
    call quicksort
    mov rax, 60
    xor rdi, rdi
    syscall
