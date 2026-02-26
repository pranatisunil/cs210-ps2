.intel_syntax noprefix
.section .text
.global AND_FRAG

# AND_FRAG:
#   INPUTS:  rax = x, rbx = &y
#   OUTPUTS: rax = x & *(&y), rbx = &y + 8
AND_FRAG:
    and rax, QWORD PTR [rbx]
    add rbx, 8
    int3
