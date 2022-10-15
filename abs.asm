.intel_syntax noprefix
.globl abs

.text
#
# %rdi = x, return |x| in %rax
# x is only integer
abs:
    mov     rsi,    rdi
    sal     rsi,    1
    jnc     .endabs
    not     rdi
    inc     rdi
.endabs:
    movq    rax,    rdi
    retq
