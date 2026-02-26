        .intel_syntax noprefix
        .section .text
        .global _start
_start:
test1:
        mov rax, 1
        mov QWORD PTR [IMUL_POSITIVE], rax
        mov QWORD PTR [IMUL_NEGATIVE], rax

        mov rbx, OFFSET data_start

        jmp IMUL_FRAG
test2:
        jmp IMUL_FRAG
test3:
        jmp IMUL_FRAG
test4:
        jmp IMUL_FRAG

        .section .data
data_start:
        .quad 5253
        .quad -210
        .quad 177
        .quad -1
data_end:
        .quad 0x0
