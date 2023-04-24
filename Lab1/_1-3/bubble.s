   	.arch armv7-a
	.text
	.global	bubblesort
	.syntax unified
	.thumb
	.thumb_func
    .type    bubblesort, %function
bubblesort:
    push {r2-r6, lr}
    mov r2, #0
    mov r3, #1
    mov r6, r0
    sub r1, r1, #1
loop:
    cmp r2, r1
    bge end
    ldr r4, [r0]
    ldr r5, [r0, #4]
    cmp r4, r5
    ble next
    str r5, [r0]
    str r4, [r0, #4]
    mov r3, #0
next:
    add r0, r0, #4
    add r2, r2, #1
    b loop
end:
    cmp r3, #1
    beq finish
    mov r2, #0
    mov r3, #1
    mov r0, r6
    sub r1, r1, #1
    b loop
finish:
    mov r0,#0
    pop {r2-r6, lr}
    bx lr
