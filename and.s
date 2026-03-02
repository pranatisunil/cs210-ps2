.intel_syntax noprefix
.section .text
.global AND_FRAG

# AND_FRAG:
#   rax = x
#   rbx = &y
#   rax <- rax & QWORD PTR [rbx]
#   rbx <- rbx + 8
AND_FRAG:
    and rax, QWORD PTR [rbx]
    add rbx, 8
    int3
