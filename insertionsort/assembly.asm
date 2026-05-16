section .text
global insertion_sort

insertion_sort:
    push rbp
    mov rbp, rsp
    mov rcx, rsi
    cmp rcx, 1
    jle .done
    mov r8, 1
.outer:
    cmp r8, rcx
    jge .done
    mov eax, [rdi + r8*4]
    mov r9, r8
    dec r9
.inner:
    cmp r9, 0
    jl .place
    mov r10d, [rdi + r9*4]
    cmp r10d, eax
    jle .place
    mov [rdi + r9*4 + 4], r10d
    dec r9
    jmp .inner
.place:
    mov [rdi + r9*4 + 4], eax
    inc r8
    jmp .outer
.done:
    pop rbp
    ret
