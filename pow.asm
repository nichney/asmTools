pow: # %rdi = x, %rsi = p, return x^p in %rax
    cmpq $0, %rdi
    je .ret_zero # if x == 0 
    
    cmpq $0, %rsi
    je .ret_one # if p == 0
    movq %rdi, %rax
.again:    
    decq %rsi
    jnz .multiply
    retq
.multiply:
    mulq %rdi # %rax *= %rdi
    jmp .again
   
.ret_one:
   movq $1, %rax # return 1
   retq
.ret_zero:
   movq $0, %rax # return 0
   retq
