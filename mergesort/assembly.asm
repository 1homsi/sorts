section .data
    arr dd 5, 2, 8, 1, 9, 3
    len equ 6

section .bss
    tmp resd 6

section .text
    global _start

merge:
    push rbp
    mov  rbp, rsp
    ret

mergesort:
    push rbp
    mov  rbp, rsp
    cmp  rsi, 1
    jle  .done
    mov  rax, rsi
    shr  rax, 1
    call mergesort
    call merge
.done:
    pop  rbp
    ret

_start:
    mov  rdi, arr
    mov  rsi, len
    call mergesort
    mov  rax, 60
    xor  rdi, rdi
    syscall
