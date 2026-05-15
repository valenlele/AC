.data
  A: .word 5
  B: .word 14
  C: .word 26
  D: .word 0

.code
  ld r1, A(r0)
  ld r2, B(r0)
  ld r3, C(r0)
  daddi r4, r0, 0

  beq r1, r2, AyB
  seguir:
    
  
  AyB:
      daddi r4, r4, 1
  
    
  
  halt