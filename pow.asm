.intel_syntax noprefix
.globl poww

.text
#
# %rdi = x, %rsi = p, return x^p in %rax
# 
poww: 
    cmpq    rdi,    0
    je      .ret_zero       # if x == 0 
    
    cmpq    rsi,    0
    je      .ret_one        # if p == 0
    movq    rax,    rdi
.again:    
    decq    rsi
    jnz     .multiply
    retq
.multiply:
    mulq    rdi             # %rax *= %rdi
    jmp     .again
   
.ret_one:
    movq    rax,    1       # return 1
    retq
.ret_zero:
    movq    rax,    0       # return 0
    retq
