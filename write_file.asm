format ELF64 executable
entry _start

filename db "just_file.txt", 0
contents db "hello, world", 0xA, 0
length = $-contents

_start:
    ; Create
    mov rax, 8
    mov rbx, filename
    mov rcx, 0777
    int 0x80

    ; descriptor
    push rax

    ; Write
    mov rax, 4
    pop rbx
    mov rcx, contents
    mov rdx, length
    int 0x80
    
    ; Close
    mov rax, 6
    ; rbx = descriptor
    int 0x80

    call exit

exit:
    mov rax, 1
    mov rbx, 0
    int 0x80