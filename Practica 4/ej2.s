.data
  A: .word 1
  B: .word 2
.code
  ld r1, A(r0) ;guarda dato de A en r1
  ld r2, B(r0) 
  sd r2, A(r0) ;guarda dato de r2 en A
  sd r1, B(r0)
  halt