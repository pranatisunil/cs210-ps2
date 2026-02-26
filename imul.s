.intel_syntax noprefix
.global IMUL_FRAG, IMUL_POSITIVE, IMUL_NEGATIVE

.data
IMUL_POSITIVE:
    .quad 0              # storage for positive y accumulations
IMUL_NEGATIVE:
    .quad 0              # storage for negative y accumulations

.text
IMUL_FRAG:
    mov rcx, [rbx]       # rcx = y (load value from memory)
    imul rax, rcx        # rax = x * y
    
    cmp rcx, 0           # compare y with 0
    jle .negative        # if y <= 0, jump to negative case
    
    # y is positive
    add [IMUL_POSITIVE], rcx   # add y to positive accumulator
    jmp .done
    
.negative:
    add [IMUL_NEGATIVE], rcx   # add y to negative accumulator
    
.done:
    add rbx, 8           # rbx = &y + 8
    int3                 # trap to debugger
