.intel_syntax noprefix
.section .text
.global OR_FRAG

# OR_FRAG:
#   INPUTS:  rax = x, rbx = &y
#   OUTPUTS: rax = x | *(&y), rbx = &y + 8
OR_FRAG:
    or  rax, QWORD PTR [rbx]
    add rbx, 8
    int3
