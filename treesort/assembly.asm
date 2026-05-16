section .data
    arr     dd 5, 3, 7, 1, 4, 6, 8
    arr_len equ 7
    fmt     db "%d ", 0
    newline db 10, 0

section .bss
    node_val  resd 100
    node_left resd 100
    node_right resd 100
    node_count resd 1
    result    resd 100
    res_count resd 1

section .text
    global main
    extern printf

insert:
    push rbp
    mov rbp, rsp
    mov eax, [rdi]
    test eax, eax
    jnz .has_node
    mov eax, [node_count]
    inc eax
    mov [node_count], eax
    mov [rdi], eax
    dec eax
    mov [node_val + eax*4], esi
    mov dword [node_left + eax*4], 0
    mov dword [node_right + eax*4], 0
    pop rbp
    ret
.has_node:
    dec eax
    cmp esi, [node_val + eax*4]
    jge .go_right
    lea rdi, [node_left + eax*4]
    call insert
    pop rbp
    ret
.go_right:
    lea rdi, [node_right + eax*4]
    call insert
    pop rbp
    ret

inorder:
    push rbp
    mov rbp, rsp
    test edi, edi
    jz .done
    dec edi
    push rdi
    mov edi, [node_left + rdi*4]
    call inorder
    pop rdi
    mov eax, [res_count]
    mov ecx, [node_val + rdi*4]
    mov [result + eax*4], ecx
    inc eax
    mov [res_count], eax
    mov edi, [node_right + rdi*4]
    call inorder
.done:
    pop rbp
    ret

main:
    push rbp
    mov rbp, rsp
    mov dword [node_count], 0
    mov dword [res_count], 0
    xor r12, r12
    mov r13d, 0
.insert_loop:
    cmp r12, arr_len
    jge .do_inorder
    mov esi, [arr + r12*4]
    lea rdi, [r13]
    call insert
    inc r12
    jmp .insert_loop
.do_inorder:
    mov edi, r13d
    call inorder
    xor r12, r12
    mov r13d, [res_count]
.print_loop:
    cmp r12d, r13d
    jge .print_done
    mov esi, [result + r12*4]
    lea rdi, [fmt]
    xor eax, eax
    call printf
    inc r12
    jmp .print_loop
.print_done:
    lea rdi, [newline]
    xor eax, eax
    call printf
    xor eax, eax
    pop rbp
    ret
