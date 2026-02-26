.intel_syntax noprefix
.section .text
.global IMUL_FRAG
.global IMUL_POSITIVE
.global IMUL_NEGATIVE

IMUL_FRAG:
    mov rcx, QWORD PTR [rbx]     # y
    imul rax, rcx                # rax = x*y

    cmp rcx, 0
    jg  .pos
.neg:
    add QWORD PTR [IMUL_NEGATIVE], rcx
    jmp .done
.pos:
    add QWORD PTR [IMUL_POSITIVE], rcx
.done:
    add rbx, 8
    int3

.section .data
IMUL_POSITIVE: .quad 0
IMUL_NEGATIVE: .quad 0
