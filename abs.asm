.intel_syntax noprefix
.globl abs

.text
#
# %rdi = x, return |x| in %rax
# x is only integer
abs:
    pushq   rdi
    sal     rdi,    1
    popq    rdi
    jnc     .endabs
    not     rdi
    inc     rdi
.endabs:
    movq    rax, rdi
    retq
