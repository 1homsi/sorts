section .data
    shrink dq 1.3

section .text
    global comb_sort

comb_sort:
    push rbp
    mov rbp, rsp
    ; rdi = pointer to array, rsi = length
    mov rcx, rsi        ; gap = n
    xor r8d, r8d        ; sorted = 0
.outer:
    cvtsi2sd xmm0, rcx
    divsd xmm0, [shrink]
    cvttsd2si rcx, xmm0
    cmp rcx, 1
    jg .no_clamp
    mov rcx, 1
    mov r8d, 1
.no_clamp:
    xor r9d, r9d        ; i = 0
.inner:
    mov rax, r9
    add rax, rcx
    cmp rax, rsi
    jge .inner_done
    mov r10, [rdi + r9*8]
    mov r11, [rdi + rax*8]
    cmp r10, r11
    jle .no_swap
    mov [rdi + r9*8], r11
    mov [rdi + rax*8], r10
    xor r8d, r8d
.no_swap:
    inc r9
    jmp .inner
.inner_done:
    cmp r8d, 0
    je .outer
    pop rbp
    ret
