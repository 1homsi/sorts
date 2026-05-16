section .data
    arr dd 12, 11, 13, 5, 6, 7
    n   dd 6

section .text
    global _start

heapify:
    push rbp
    mov rbp, rsp
    ; rdi = arr base, rsi = n, rdx = i
    mov rax, rdx        ; largest = i
    mov rcx, rdx
    lea rcx, [rcx*2+1]  ; left = 2*i+1
    mov r8, rdx
    lea r8, [r8*2+2]    ; right = 2*i+2
    cmp rcx, rsi
    jge .check_right
    mov r9d, [rdi+rcx*4]
    cmp r9d, [rdi+rax*4]
    jle .check_right
    mov rax, rcx
.check_right:
    cmp r8, rsi
    jge .check_swap
    mov r9d, [rdi+r8*4]
    cmp r9d, [rdi+rax*4]
    jle .check_swap
    mov rax, r8
.check_swap:
    cmp rax, rdx
    je .done
    mov r9d, [rdi+rdx*4]
    mov r10d, [rdi+rax*4]
    mov [rdi+rdx*4], r10d
    mov [rdi+rax*4], r9d
    mov rdx, rax
    call heapify
.done:
    pop rbp
    ret

_start:
    lea rdi, [arr]
    mov rsi, 6
    mov rdx, 2          ; start from n/2-1=2
.build_heap:
    call heapify
    dec rdx
    jns .build_heap
    mov rbx, 5          ; i = n-1
.sort_loop:
    test rbx, rbx
    jz .exit
    mov eax, [arr]
    mov ecx, [arr+rbx*4]
    mov [arr], ecx
    mov [arr+rbx*4], eax
    lea rdi, [arr]
    mov rsi, rbx
    mov rdx, 0
    call heapify
    dec rbx
    jmp .sort_loop
.exit:
    mov eax, 60
    xor edi, edi
    syscall
