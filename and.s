
.intel_syntax noprefix
.global AND_FRAG

# AND_FRAG Fragment
# INPUTS: rax -> x
#         rbx -> &y (the address of where in memory y is)
# OUTPUTS: x = x bitwise and y : update rax with bitwise AND of rax and the 
#                                8 byte quantity at the location of &y
#          In addition, rbx should be updated to equal &y + 8

.text
AND_FRAG:
    and rax, [rbx]      # rax = rax & (value at address rbx)
    add rbx, 8          # rbx = &y + 8
    int3                # trap to debugger
