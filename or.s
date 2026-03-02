.intel_syntax noprefix
.section .text
.global OR_FRAG

# OR_FRAG:
#   rax = x
#   rbx = &y
#   rax <- rax | QWORD PTR [rbx]
#   rbx <- rbx + 8
OR_FRAG:
    or  rax, QWORD PTR [rbx]
    add rbx, 8
    int3
