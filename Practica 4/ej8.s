      .data
OP1:  .word 4
OP2:  .word 2
RES:  .word 0

      .code
      ld r1, OP1(r0)
      ld r2, OP2(r0)
      dadd r3, r0, r0

      beqz r1, fin
      beqz r2, fin
     
loop: daddi r2, r2, -1
      bne r2, r0, loop
      dadd r3, r3, r1

fin:  sd r3, RES(r0)
     
      halt