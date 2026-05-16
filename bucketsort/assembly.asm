section .data
    arr     dd 78, 17, 39, 26, 72, 94, 21, 12, 23, 68
    n       equ 10
    fmt     db "%d ", 0
    newline db 10, 0

section .bss
    buckets resd 100
    counts  resd 10

section .text
    global main
    extern printf

insertion_sort:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    mov edx, [ebp+12]
    cmp edx, 1
    jle .done
    mov esi, 1
.outer:
    cmp esi, edx
    jge .done
    mov eax, [ecx + esi*4]
    mov edi, esi
    dec edi
.inner:
    cmp edi, 0
    jl .place
    mov ebx, [ecx + edi*4]
    cmp ebx, eax
    jle .place
    mov [ecx + edi*4 + 4], ebx
    dec edi
    jmp .inner
.place:
    mov [ecx + edi*4 + 4], eax
    inc esi
    jmp .outer
.done:
    pop ebp
    ret

main:
    push ebp
    mov ebp, esp
    xor eax, eax
    mov ecx, n
    mov esi, arr
.init_counts:
    mov dword [counts + eax*4], 0
    inc eax
    cmp eax, n
    jl .init_counts
    mov ecx, n
    xor edi, edi
.fill_buckets:
    cmp edi, n
    jge .sort_buckets
    mov eax, [arr + edi*4]
    mov ebx, 10
    mul ebx
    mov ebx, n
    div ebx
    cmp eax, n
    jl .store
    mov eax, n
    dec eax
.store:
    mov ebx, [counts + eax*4]
    lea ecx, [buckets + eax*10*4]
    mov [ecx + ebx*4], dword [arr + edi*4]
    inc dword [counts + eax*4]
    inc edi
    jmp .fill_buckets
.sort_buckets:
    xor esi, esi
    xor edi, edi
.bucket_loop:
    cmp esi, n
    jge .print
    lea ecx, [buckets + esi*10*4]
    mov edx, [counts + esi*4]
    push edx
    push ecx
    call insertion_sort
    add esp, 8
    xor ebx, ebx
.copy:
    cmp ebx, [counts + esi*4]
    jge .next_bucket
    lea ecx, [buckets + esi*10*4]
    mov eax, [ecx + ebx*4]
    mov [arr + edi*4], eax
    inc edi
    inc ebx
    jmp .copy
.next_bucket:
    inc esi
    jmp .bucket_loop
.print:
    xor esi, esi
.print_loop:
    cmp esi, n
    jge .exit
    push dword [arr + esi*4]
    push fmt
    call printf
    add esp, 8
    inc esi
    jmp .print_loop
.exit:
    push newline
    call printf
    add esp, 4
    xor eax, eax
    pop ebp
    ret
