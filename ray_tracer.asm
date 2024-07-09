; setting up initial ray and a single sphere for testing the intersection logic

; Section for data structures
.data

; to define structure for storing sphere data x, y, z coordinates and radius
sphere_struct:
    .quad 4          ; 
    .quad 0.0         ; 
    .quad 0.0         ; 
    .quad 0.0         ; 
    .float 1.0        ; 

scene:
    .quad sphere_struct  ; 

.globl main

.text
print_message:
    mov    rdi, format_string  ; 
    mov    rsi, arg1            ; 
    xor    rdx, rdx            ; 
    mov    rax, 1               ; 
    int    0x80               ; 

format_string:
    .string "Message: %s\n"      ;
arg1:
    .asciz "testing rn.."   ;

; Main function
main:
    pushq %rbp
    movq %rsp, %rbp
    
    mov    rax, 10              ; 
    shl    rax, 3               ; 
    mov    qword [rsp - 8], rax  ; 

    mov    rax, 20              ; 
    imul   rax, rax             ; 
    mov    qword [rsp - 16], rax ; 

    addl   %eax, %esp           ; 

    mov    rdi, message_to_print
    call   print_message

    ; pop stack frame and exit
    popq %rbp
    ret

message_to_print:
    .asciz "Ray tracing calculations complete\n"

