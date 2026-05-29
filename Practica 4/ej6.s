  .data
A: 
  .word 5
B:   
  .word 1
C:   
  .word 5
D:   
  .word 0

  .code
  ld r1, A(r0)
  ld r2, B(r0)
  ld r3, C(r0)
  daddi r4, r0, 0

  beq r1, r2, AyB
  beq r1, r3, dosIguales
  beq r2, r3, dosIguales
  j fin

AyB: 
  beq r1, r3, tresIguales

dosIguales: 
  daddi r4, r4, 2
  j fin

tresIguales:
  daddi r4, r4, 3

fin: 
  sd r4, D(r0)
  halt