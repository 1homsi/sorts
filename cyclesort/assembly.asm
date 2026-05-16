section .data
    arr dd 5, 4, 3, 2, 1
    n   dd 5
    fmt db "%d ", 0
    nl  db 10, 0

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov ecx, dword [n]
    dec ecx
    xor r8d, r8d

.cycle_loop:
    cmp r8d, ecx
    jge .done

    mov esi, r8d
    lea rax, [arr]
    mov edi, dword [rax + rsi*4]
    mov r9d, r8d

    mov r10d, r8d
    inc r10d

.count_loop:
    cmp r10d, dword [n]
    jge .count_done
    mov r11d, dword [rax + r10*4]
    cmp r11d, edi
    jge .no_inc
    inc r9d
.no_inc:
    inc r10d
    jmp .count_loop

.count_done:
    cmp r9d, r8d
    je .next_cycle

.skip_dups:
    mov r11d, dword [rax + r9*4]
    cmp r11d, edi
    jne .do_swap
    inc r9d
    jmp .skip_dups

.do_swap:
    mov r11d, dword [rax + r9*4]
    mov dword [rax + r9*4], edi
    mov edi, r11d

.inner_loop:
    cmp r9d, r8d
    je .next_cycle

    mov r9d, r8d
    mov r10d, r8d
    inc r10d

.inner_count:
    cmp r10d, dword [n]
    jge .inner_count_done
    mov r11d, dword [rax + r10*4]
    cmp r11d, edi
    jge .no_inc2
    inc r9d
.no_inc2:
    inc r10d
    jmp .inner_count

.inner_count_done:
.inner_skip:
    mov r11d, dword [rax + r9*4]
    cmp r11d, edi
    jne .inner_swap
    inc r9d
    jmp .inner_skip

.inner_swap:
    mov r11d, dword [rax + r9*4]
    mov dword [rax + r9*4], edi
    mov edi, r11d
    jmp .inner_loop

.next_cycle:
    inc r8d
    jmp .cycle_loop

.done:
    xor r8d, r8d
.print_loop:
    cmp r8d, dword [n]
    jge .exit
    lea rax, [arr]
    mov esi, dword [rax + r8*4]
    lea rdi, [fmt]
    xor eax, eax
    call printf
    inc r8d
    jmp .print_loop

.exit:
    lea rdi, [nl]
    xor eax, eax
    call printf
    xor eax, eax
    pop rbp
    ret
