        .text
        .align  1
        .globl  bubblesort
        .type   bubblesort, @function
bubblesort:
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)
    sd s1, 8(sp)
    mv s0, a0
    mv s1, a1
    addi s1, s1, -1
outer_loop:
    li t2, 0
    li t3, 0
inner_loop:
    bge t2, s1, inner_end
    lw t4, 0(s0)
    lw t5, 4(s0)
    bge t5, t4, next
    sw t5, 0(s0)
    sw t4, 4(s0)
    li t3, 1
next:
    addi s0, s0, 4
    addi t2, t2, 1
    j inner_loop
inner_end:
    beqz t3, end
    addi s1,s1,-1
    mv s0,a0
    j outer_loop
end:
    li a0, 0
    ld ra, 24(sp)
    ld s0, 16(sp)
    ld s1, 8(sp)
    addi sp, sp, 32
    jr ra
.L2:
        li      a0,0
        ret
        .size   bubblesort, .-bubblesort
