section .data
    arr dd 3, 1, 4, 1, 5, 9, 2, 6
    n   dd 8
    fmt db "%d ", 0
    nl  db 10, 0

section .text
    global main
    extern printf, srand, rand, time

is_sorted:
    push rbp
    mov rbp, rsp
    mov rcx, [rel n]
    dec rcx
    xor rax, rax
.loop:
    cmp rax, rcx
    jge .sorted
    mov r8d, [rel arr + rax*4]
    mov r9d, [rel arr + rax*4 + 4]
    cmp r8d, r9d
    jg .not_sorted
    inc rax
    jmp .loop
.sorted:
    mov eax, 1
    pop rbp
    ret
.not_sorted:
    xor eax, eax
    pop rbp
    ret

shuffle:
    push rbp
    mov rbp, rsp
    mov r12d, [rel n]
    dec r12d
.sloop:
    cmp r12d, 1
    jl .done
    call rand
    xor edx, edx
    mov ecx, r12d
    inc ecx
    div ecx
    mov r13d, edx
    mov eax, [rel arr + r12*4]
    mov ebx, [rel arr + r13*4]
    mov [rel arr + r12*4], ebx
    mov [rel arr + r13*4], eax
    dec r12d
    jmp .sloop
.done:
    pop rbp
    ret

main:
    push rbp
    mov rbp, rsp
    xor edi, edi
    call time
    mov edi, eax
    call srand
.bogo:
    call is_sorted
    test eax, eax
    jnz .print
    call shuffle
    jmp .bogo
.print:
    xor r15d, r15d
    mov ecx, [rel n]
.ploop:
    cmp r15d, ecx
    jge .end
    lea rdi, [rel fmt]
    mov esi, [rel arr + r15*4]
    xor eax, eax
    call printf
    inc r15d
    jmp .ploop
.end:
    lea rdi, [rel nl]
    xor eax, eax
    call printf
    xor eax, eax
    pop rbp
    ret
