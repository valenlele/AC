      .data
A:    .word 1
B:    .word 6
TABLA: .word 0

      .code
      ld r2, B(r0)
      ld r1, A(r0)
      dadd r4, r4, r0

loop: daddi r2, r2, -1
      dsll r1, r1, 1
      sd r1, TABLA(r4)
      daddi r4, r4, 8
      bnez r2, loop
      halt

; los elementos de la tabla son las potencias de 2 desde 2^1 hasta 2^6