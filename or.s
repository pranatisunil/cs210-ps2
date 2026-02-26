.intel_syntax noprefix
.global OR_FRAG

# OR_FRAG Fragment
# INPUTS: rax -> x
#         rbx -> &y (the address of where in memory y is)
# OUTPUTS: x = x bitwise or y : update rax with bitwise OR of the 8 byte quantity at the location of &y
#          In addition, rbx should be updated to equal &y + 8

.text
OR_FRAG:
    or rax, [rbx]       # rax = rax | (value at address rbx)
    add rbx, 8          # rbx = &y + 8
    int3                # trap to debugger
